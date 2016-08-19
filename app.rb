# set up a landing page for Squidbot
# use httparty to post the anonymous message to Slack’s incoming webhoook
require 'sinatra'
require 'httparty'
require 'json'

#homepage
get '/' do
  	erb :index
end

get '/anonymize' do
  postback params[:text], params[:channel_id]
  status 200
end

def postback message, channel
    slack_webhook = ENV['SLACK_WEBHOOK_URL']
    HTTParty.post slack_webhook, body: {"text" => message.to_s, "username" => "Squid", "channel" => params[:channel_id]}.to_json, headers: {'content-type' => 'application/json'}
end
