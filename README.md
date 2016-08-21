SquidBot - Post Anonymously In Slack
=============

 [Slack](https://slack.com/) is a messaging app for thousands of teams around the world.

 SquidBot is a Slack bot written in ruby that connects via the [Slack API](https://api.slack.com) and helps team members send anonymous messages to other members.

 Think of SquidBot as a good way for team members to be honest with each other and quickly build trust.

 I recommend one rule for all users: "Say Nothing Hateful".

To run your own version of SquidBot you need:

1. a [Slack](https://slack.com) account to send and receive team messages
2. [Ruby 2.3](https://www.ruby-lang.org/en/documentation/installation/) and installed on your computer
3. [Github](https://github.com/) setup via the command line  or the [Github Desktop](https://desktop.github.com/) app
3. a free [Heroku](https://www.heroku.com) hosting account for the SquidBot code and [Kaffeine](http://kaffeine.herokuapp.com) to keep your server awake.



Installation
-----------

1. Download the SquidBot code

        git clone https://github.com/wisesumo/squidbot.git
        cd squidbot

2. Install dependencies ([Bundler](http://bundler.io/) is recommended.)

        bundle install

3. Run SquidBot locally using [Sinatra](https://github.com/sinatra/sinatra)

        ruby app.rb

4. Deploy SquidBot to [Heroku](https://devcenter.heroku.com/articles/rack) *Note*: Copy your newly deployed Heroku URL because you will need it later when configuring Slack.

        $ git init
        $ git add .
        $ git commit -m 'launching SquidBot'
        $ heroku create
        $ git push heroku master


5. Add SquidBot to your Slack team by using both the *slash command* and *incoming webhook* custom integration features of the [Slack apps platform](https://slack.com/apps/manage/custom-integrations)

         Slash Command:   
         select custom integration and click on the slash commands link
         select "Add Configuration" on the next page and name your slash command "Squid" and follow the remaining instructions
         on the next page fill in the URL field with your deployed Heroku URL (copied earlier)
         make sure your endpoint is https and you set the Method as GET - Hit "Save Integration"

         Incoming WebHook:
         select custom integration and click on the Incoming WebHooks link
         on the Configuration page, select the channel you want SquidBot to appear and follow the remaining instructions.
         the following page will show a Webhook URL. Please copy the Webhook URL.
         Open a command line / Terminal window and set up a Heroku environment variable using the saved Webhook URL.
         From the command line inside the project directory, run: heroku config:set SLACK_WEBHOOK_URL=https://hooks.slack.com/services/your-webhook-url

         ALL DONE!


*Note*: To test SquidBot, enter the channel you selected during the Slack setup and begin typing with /squid [your message text]
