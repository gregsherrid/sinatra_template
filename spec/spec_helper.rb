require "sinatra"
require 'rack/test'
set :environment, :test
require "./app.rb"
require "factory_girl"

FactoryGirl.definition_file_paths = %w{./factories ./test/factories ./spec/factories}
FactoryGirl.find_definitions

RSpec.configure do |config|
	config.expect_with :rspec do |c|
		c.syntax = [:should,:expect]

		require 'database_cleaner'
		config.before(:suite) do
			DatabaseCleaner.strategy = :transaction
			DatabaseCleaner.clean_with(:truncation)
		end
	end
end

def app
	Sinatra::Application
end
