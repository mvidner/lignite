require "lignite"
require "thor"
require "fileutils"
require "objspace"

module Lignite
  # Implements the `ev3tool` command line interface
  class Ev3Tool < Thor
    # The VM current working directory is /home/root/lms2012/sys
    # which is not very useful. A better default is /home/root/lms2012/prjs
    # which is displayed on the 2nd tab of the brick UI.
    EV3TOOL_HOME = "../prjs".freeze

    include Lignite::Bytes

    def self.exit_on_failure?
      true
    end

    desc "upload LOCAL_FILENAME [BRICK_FILENAME]", "upload a program or a file"
    map "ul" => "upload"
    def upload(local_filename, brick_filename = nil)
      data = File.read(local_filename, encoding: Encoding::BINARY)
      unless brick_filename
        prj = File.basename(local_filename, ".rbf")
        brick_filename = "#{EV3TOOL_HOME}/#{prj}/#{prj}.rbf"
      end
      handle = sc.begin_download(data.bytesize, brick_filename)
      sc.continue_download(handle, data)
    end

    desc "download BRICK_FILENAME [LOCAL_FILENAME]", "download a file"
    map "dl" => "download"
    def download(brick_filename, local_filename = nil)
      local_filename ||= File.basename(brick_filename)
      fsize, handle, data = sc.begin_upload(4096, brick_filename)
      File.open(local_filename, "w") do |f|
        loop do
          f.write(data)
          fsize -= data.bytesize
          break if fsize.zero?
          handle, data = sc.continue_upload(handle, 4096)
        end
      end
    end

    desc "list-files DIRNAME", "list DIRNAME in a long format"
    map "ls-l" => "list-files"
    def list_files(name)
      puts raw_list_files(name)
    end

    desc "ls DIRNAME", "list DIRNAME in a short format"
    def ls(name)
      puts raw_ls(name)
    end

    no_commands do
      def raw_list_files(name)
        name ||= EV3TOOL_HOME
        name = "#{EV3TOOL_HOME}/#{name}" unless name.start_with?("/")

        result = ""
        fsize, handle, data = sc.list_files(4096, name)
        loop do
          result += data
          fsize -= data.bytesize
          break if fsize.zero?
          handle, data = sc.continue_list_files(handle, 4096)
        end
        result
      rescue Lignite::VMError
        nil
      end

      def raw_ls(name)
        raw = raw_list_files(name)
        return nil if raw.nil?

        raw.lines.map do |l|
          l = l.chomp
          next nil if ["./", "../"].include?(l)
          next l if l.end_with?("/")
          # skip checksum + space + size + space
          l[32 + 1 + 8 + 1..-1]
        end.compact
      end

      def runnable_name(name)
        if name.start_with?("/")
          name
        elsif name.include?("/")
          "#{EV3TOOL_HOME}/#{name}"
        else
          "#{EV3TOOL_HOME}/#{name}/#{name}.rbf"
        end
      end
    end

    desc "start NAME", "start a program"
    def start(name)
      name = runnable_name(name)

      raise Thor::Error, "File #{name.inspect} not found on the brick" unless file_exist?(name)

      slot = Lignite::USER_SLOT
      no_debug = 0
      dc.block do
        # these are local variables
        data32 :size
        data32 :ip
        file_load_image(slot, name, :size, :ip)
        program_start(slot, :size, :ip, no_debug)
      end
    end

    desc "stop", "stop a running program"
    def stop
      dc.program_stop(Lignite::USER_SLOT)
    end

    no_commands do
      def file_exist?(name)
        dirname = File.dirname(name)
        filename = File.basename(name)
        files = raw_ls(dirname) || []
        files.include?(filename)
      end

      def assisted_connection
        c = Lignite::Connection.create
        # When invoking via Thor we can't get at the instance otherwise :-/
        ObjectSpace.define_finalizer(self, ->(_id) { close })
        c
      rescue StandardError => e
        fn = Lignite::Connection::Bluetooth.config_filename
        $stderr.puts <<MSG
Could not connect to EV3.
Use a USB cable or configure a Bluetooth address in #{fn.inspect}.
Details:
  #{e.message}
MSG

        try_config_from_template(fn, Lignite::Connection::Bluetooth.template_config_filename)
        raise Thor::Error, ""
      end

      def try_config_from_template(config_fn, template_fn)
        return unless !File.exist?(config_fn) && File.exist?(template_fn)
        FileUtils.mkdir_p(File.dirname(config_fn))
        FileUtils.install(template_fn, config_fn)
        $stderr.puts "(A template config file has been copied for your convenience)"
      end

      def sc
        return @sc if @sc
        @sc = Lignite::SystemCommands.new(conn)
      end

      def dc
        return @dc if @dc
        @dc = Lignite::DirectCommands.new(conn)
      end

      def conn
        @conn ||= assisted_connection
      end

      def close
        @conn.close if @conn
        @conn = nil
      end
    end
  end
end
