# set up the dependencies needed to run SquidBot
# use httparty and json gems to handle anonymous messaging via Slack’s API
require 'sinatra'
require 'httparty'
require 'json'

# standard Ruby Sinatra code to setup the homepage for SquidBot.
# go to Views/index.erb to edit the homepage
get '/' do
  	erb :index
end

# capture text and channel ID info sent to /anonymize and pass on to postback for processing
# send a status 200 for a successful HTTP request
get '/anonymize' do
  postback params[:text], params[:channel_id]
  status 200
end


# connect to Slack via a webhook
# use httparty hash and json to post the message body and overwritten username [changed to Squid]
# back to the Slack channel that sent the message.
def postback message, channel
    slack_webhook = ENV['SLACK_WEBHOOK_URL']
    HTTParty.post slack_webhook, body: {"text" => message.to_s, "username" => "Squid", "channel" => params[:channel_id]}.to_json, headers: {'content-type' => 'application/json'}
end
