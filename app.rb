# (c) Gregory Sherrid, 2014-10-7, example tasker
# ssh -i ~/.ssh/kraken-aws.pem ubuntu@ec2-54-191-81-151.us-west-2.compute.amazonaws.com

require "sinatra"
require "sinatra/activerecord"

Dir["./models/*.rb"].each{|file| require file }

get "/info" do
	erb :info
end

get "/" do
	"Greg's Sinatra Template App"
end