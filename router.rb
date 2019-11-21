require "rubygems"
require "sinatra"
require "haml"

class DylanTonic < Sinatra::Base
  get "/" do
    haml :index
  end
end