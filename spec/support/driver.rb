require "selenium-webdriver"

module SpecSupport
  class << self
    def firefox_driver
      Selenium::WebDriver.for :firefox
    end

    def screener_driver
      puts "Creating new Screener Driver"
      puts "  API Key: #{ENV["SCREENER_API_KEY"][1..3]}"
      screener_caps = {
        browserName: "Chrome",
        build: ENV["TRAVIS_BUILD_NUMBER"] || "#{ENV["TRAVIS_BRANCH"]}_#{ENV["TRAVIS_JOB_NUMBER"]}",
        screener: {
          name: "Twitch Index Page - Chrome",
          resolution: "1280x1024",
          apiKey: "#{ENV["SCREENER_API_KEY"]}",
          group: "5dd61360d5a0b38e6404a93d"
        }
      }

      Selenium::WebDriver.for(
        :remote, 
        :url => "https://hub.screener.io/wd/hub", 
        :desired_capabilities => screener_caps
      )
    end
  end
end