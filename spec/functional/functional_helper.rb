ENV['RACK_ENV'] = "test"

require_relative "../spec_helper"
require_relative "../support/driver.rb"

require "rspec"

require File.expand_path '../../../router.rb', __FILE__

RSpec.configure do |config|
  config.before(:suite) do
    @app = ChildProcess.build("rackup")
    @app.cwd = File.expand_path '../../../', __FILE__
    @app.start
    puts "Web app running" if @app.alive?
  end

  config.before(:example) do
    begin
      @driver = SpecSupport.screener_driver
    rescue => e
      puts e
    end
  end

  config.after(:example) do
    @driver.quit
    @driver = nil
  end
end