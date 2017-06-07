# Deploying a Rails Application to Heroku

### Overview

This clinic walks through the process of deploying a Rails app to Heroku.

We'll start with a sample Rails app that we've cloned from GitHub.

1. `brew install heroku`
2. Make an account on Heroku if you have not already done so

[Deploying a Rails app to Heroku docs](https://devcenter.heroku.com/articles/getting-started-with-rails5#deploy-your-application-to-heroku)

Some notes about your Rails app:

##### Gemfile

Your `Gemfile` should contain this:

```rb
group :production do
  gem "puma"
  gem "rails_12factor"
end
```

`rails_12factor` is a Heroku gem that does a couple different things for you to make rails deployment more convenient.

##### `database.yml`

Your `database.yml` file should contain a couple lines for `production`

```
production:
  <<: *default
  database: git_off_my_lawn_production
  username: git_off_my_lawn
  password: <%= ENV['GIT_OFF_MY_LAWN_DATABASE_PASSWORD'] %>
```

##### Add `config/puma.rb` file

```
workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'
```

### Deployment!

`heroku create`

Type in `git remote -v` to ensure that an endpoint called `heroku` has been created.

`git push heroku master`  
`heroku run rails db:migrate`  
`heroku run rake db:seed`  
`heroku logs -t` to check out any errors
