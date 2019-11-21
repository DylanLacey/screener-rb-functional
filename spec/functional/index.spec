require_relative "functional_helper"

RSpec.describe "The index page" do
  it "loads without error" do
    @driver.navigate.to "http://localhost:3000/"
  end

  it "has a link to Twitch" do
    @driver.navigate.to "http://localhost:3000/"
    @driver.find_element :link_text, "Twitch!"
  end
end