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
      puts "Problem creating driver"
      puts e
      exit 1
    end
  end

  config.after(:example) do
    @driver.quit if @driver
    @driver = nil
    puts "Env Vars"
    puts "  Group ID: #{SCREENER_GROUP_ID}"
    puts "  Build Number: #{TRAVIS_BUILD_NUMBER}"
    puts "  Repo Slug: #{TRAVIS_REPO_SLUG}"
    puts "  Commit: #{TRAVIS_PULL_REQUEST_SHA}"
  end
end