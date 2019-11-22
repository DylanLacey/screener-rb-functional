require_relative "functional_helper"

RSpec.describe "The index page" do
  it "loads without error" do
    @driver.navigate.to "http://localhost:3000/"
  end

  it "has a link to Twitch" do
    @driver.navigate.to "http://cashdeck.com/"
    # @driver.find_element :link_text, "Twitch!"
    @driver.execute_script "/*@screener.snapshot*/", "Standard Home Page"
  end
end