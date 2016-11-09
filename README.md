# workshop-portal

A Ruby on Rails app to manage workshops

Branch      | Status     | Heroku Deploy
----------- | ---------- | ---------- 
master  | [![Build Status](https://travis-ci.org/hpi-swt2/workshop-portal.svg?branch=master)](https://travis-ci.org/hpi-swt2/workshop-portal) [![Coverage Status](https://coveralls.io/repos/github/hpi-swt2/workshop-portal/badge.svg?branch=master)](https://coveralls.io/github/hpi-swt2/workshop-portal?branch=master) [![Code Climate](https://codeclimate.com/github/hpi-swt2/workshop-portal/badges/gpa.svg)](https://codeclimate.com/github/hpi-swt2/workshop-portal/issues) | [![Heroku](https://heroku-badge.herokuapp.com/?app=workshop-portal)](http://workshop-portal.herokuapp.com/) [[link to app]](http://workshop-portal.herokuapp.com/)
dev  | [![Build Status](https://travis-ci.org/hpi-swt2/workshop-portal.svg?branch=dev)](https://travis-ci.org/hpi-swt2/workshop-portal) [![Coverage Status](https://coveralls.io/repos/github/hpi-swt2/workshop-portal/badge.svg?branch=dev)](https://coveralls.io/github/hpi-swt2/workshop-portal?branch=dev) | [![Heroku](https://heroku-badge.herokuapp.com/?app=workshop-portal-dev)](http://workshop-portal-dev.herokuapp.com/) [[link to app]](http://workshop-portal-dev.herokuapp.com/)

(When TravisCI run all tests successfully, the build is deployed to Heroku, for the master as well as the dev branch. Click the badges for detailed info)

## Local Setup

* `bundle install` Install the required Ruby gem dependencies defined in the [Gemfile](https://github.com/hpi-swt2/workshop-portal/blob/master/Gemfile)

* `cp database.sqlite.yml database.yml` Select database config (for development we recommend SQLite) 

* `rake db:create db:migrate db:seed` Setup database, run migrations, seed the database with defaults

* `rails s` Start the Rails development server (By default runs on _localhost:3000_)

* `rspec` Run all the tests (using the [RSpec](http://rspec.info/) test framework)

## Setup using Vagrant (Virtual Machine)

In case you want to setup this project via windows, you may want to use vagrant like described in the following. Please keep in mind, that vagrant will be slower since it is handled via VM.

```
vagrant up
vagrant ssh
cd hpi-swt2
# disable docs for gems
echo “gem: --no-document” >> ~/.gemrc
bundle install
gem install pg
cp config/database.psql.yml config/database.yml
# restarting the session
exit
```

in case you want to use sqlite

```
bundle install --without=production
cp config/database.sqlite.yml config/database.yml
```

And finally starting the server with

```
vagrant ssh #connect with VM
cd hpi-swt2
rails s -b 0 #starting rails server, the -b part is necessary since the app is running in a VM and would otherwise drop the requests coming from the host OS
```

## Debugging

### Errbit
```
http://swt2-2016-errbit.herokuapp.com/
```

Please request a login from @chrisma or @derari

### NewRelic
`http://newrelic.com/`

## Tips & Tricks
* `rails c` Run the Rails console
* `rspec spec/controller/expenses_controller_spec.rb` Specify a folder or test file to run
