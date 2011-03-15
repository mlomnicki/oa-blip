require 'rubygems'
require 'bundler'
Bundler.setup
require 'rspec'
require 'rspec/autorun'
require 'rack/test'
require 'oa-blip'

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.extend  OmniAuth::Test::StrategyMacros, :type => :strategy
end
