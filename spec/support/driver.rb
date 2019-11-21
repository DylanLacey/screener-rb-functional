require "selenium-webdriver"

module SpecSupport
  class << self
    def firefox_driver
      Selenium::WebDriver.for :firefox
    end
  end
end