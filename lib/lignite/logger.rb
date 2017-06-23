require "logger"

module Lignite
  module Logger
    def self.default_logger
      logger = ::Logger.new(STDERR)
      logger.level = $VERBOSE ? ::Logger::DEBUG : ::Logger::INFO
      logger
    end

    def logger
      @logger ||= Logger.default_logger
    end
  end
end
