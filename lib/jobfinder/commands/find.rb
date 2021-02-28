require 'httparty'

module Jobfinder::Commands
  class Find
    def self.default_options
      {
        location: nil,
        only_remote_job: false
      }
    end

    def initialize(job, options = {})
      @job = job
      @options = options
    end

    def search
      query = "https://stackoverflow.com/jobs/feed?q=#{job}&l=#{options.location}&r=#{options.only_remote_job}"

      HTTParty.get(query).body
    end

    private

    attr_reader :job, :options
  end
end
