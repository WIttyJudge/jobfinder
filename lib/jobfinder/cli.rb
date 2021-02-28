require 'commander'

require_relative 'version'

require_relative 'commands/find'
require_relative 'parser/stackoverflow'
require_relative 'output/stackoverflow'

module Jobfinder
  class CLI
    include Commander::Methods

    def run
      program :name, 'findjob'
      program :version, VERSION
      program :description, 'CLI application to help you find job.'

      command :find do |c|
        c.syntax = 'findjob [job] [options]'
        c.description = '- Find job by specific programming language, e.g "javascript"'
        c.option '--location STRING', String, 'Specific location'
        c.option '--only-remote-job BOOLEAN', String, 'Show only job available for remote work.'
        c.action do |args, options|
          options.default Commands::Find.default_options

          job = args.join(' ')
          body = Commands::Find.new(job, options).search

          result = Parser::Stackoverflow.call(body)

          result.each do |info|
            Output::Stackoverflow.call(info)
          end

        end
      end

      default_command :find

      run!
    end
  end
end
