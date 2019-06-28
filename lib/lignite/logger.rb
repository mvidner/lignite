# typed: true
require "logger"

module Lignite
  # Include this to provide a simple `logger.debug` etc.
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
