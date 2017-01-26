# cowsay-slack

A collection of slash commands for slack

## Running Locally

Make sure you have [Ruby](https://www.ruby-lang.org/) and the [Heroku Toolbelt](https://toolbelt.heroku.com/) installed.

```sh
git clone git@github.com:avidit/slash-slack.git
cd slash-slack
bundle install
```

run `heroku local`

Your app should now be running on [localhost:5000](http://localhost:5000/).

## Deploying to Heroku

```sh
heroku create
git push heroku master
heroku open
```

Alternatively, [![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

## Adding Slash commands to Slack

[Documentation](https://api.slack.com/legacy/custom-integrations/slash-commands)

Commands

```text
/gif smile
/xkcd 149
/meme yallgot; y'all got any more of them; memes
```
