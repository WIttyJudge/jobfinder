require 'colorize'

module Jobfinder
  module Output
    class Stackoverflow
      def initialize(info)
        @info = info
      end

      def self.call(*args)
        new(*args).call
      end

      def call
        puts "\n"

        say info.published, color: :green

        say info.title

        puts "Link: #{info.url}".underline
      end

      private

      attr_reader :info

      def say(message = '', color = :default)
        text = "#{message}".colorize(color)

        puts text
      end
    end
  end
end
