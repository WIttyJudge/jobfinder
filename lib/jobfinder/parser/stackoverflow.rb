require 'feedjira'

module Jobfinder::Parser
  class Stackoverflow
    def initialize(body)
      @body = body
    end

    def self.call(*args)
      new(*args).call
    end

    def call
      Feedjira.parse(body).entries
    end

    private

    attr_reader :body
  end
end
