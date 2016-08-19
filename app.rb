# set up a landing page for Squidbot
# use httparty to post the anonymous message to Slack’s incoming webhoook
require 'sinatra'
require 'httparty'

#homepage
get '/' do
  	erb :index
end
