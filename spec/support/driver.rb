require "selenium-webdriver"

module SpecSupport
  class << self
    def firefox_driver
      Selenium::WebDriver.for :firefox
    end

    def screener_driver
      screener_caps = {
        browserName: "Chrome",
        screener: {
          name: "Twitch Index Page - Chrome",
          resolution: "1280x1024",
          apiKey: "c9ac4870-9f8f-4340-913d-9b6a0e6f67f3",
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