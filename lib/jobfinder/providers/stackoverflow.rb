module Providers
  class Stackoverflow
    def self.url
      "https://stackoverflow.com/jobs/feed?q=#{job}"
    end
  end
end
