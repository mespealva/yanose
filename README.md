# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## Ruby and Rails version
The following are listed in the Gemfile
- Ruby 2.7.0
- Rails 5.2.4

## System dependencies
- Postgres 12.1

## Configuration
The following gems were imported for this project. They are
also specified in the Gemfile:

###General Application
- gem 'devise' 4.7.1
- gem 'bootstrap-sass' 3.4.1
- gem 'autoprefixer-rails' 9.7.4
- gem 'jquery-rails' 4.3.5
- gem 'rspec' 3.9.0
- gem 'rspec-rails' 3.9.0
- gem 'rubocop' 0.79.0
- gem 'rubocop-rspec' 1.37.1

###Developemnt/Testing
- gem 'spring' 2.1.0
- gem 'spring-watcher-listen' 2.0.1
- gem 'selenium-webdriver' 3.142.7 # Adds support for Capybara system testing and selenium driver
- gem 'capybara' 3.30.0 # This specific version is required as 3.31.0 has a defect
- gem 'rails-controller-testing' 1.0.4 # Only required if you want to specifically test controllers
- gem 'factory_bot_rails' 5.1.1
- gem 'faker'  2.10.1

###Spring
For development purposes running Spring helps preload your application
for faster development. It speeds up development by keeping your application running in the background so you don't 
need to boot it every time you run a test, rake task or migration. 

Please see ['Spring Setup'](https://github.com/rails/spring#setup) for futher
configuration instrucitons.

###Devise
To add the ability for authentication the Devise gem is used in this project.
Please see the ['Getting Started'](https://github.com/heartcombo/devise#getting-started)
instructions for futher instructions and configuration information.

There is also a ['How To'](https://github.com/heartcombo/devise/wiki/How-Tos) section
that has lots of great examples.

##Database creation

Ensure you are creating the database in the appropriate environment
for which you are working in using the RAILS_ENV switch. The default database
 environment is also specified in /config/database.yml 
is also 
```sh
$ rake db:setup RAILS_ENV=[development,test,production]
```
```sh
$ rake db:migrate RAILS_ENV=[development,test,production]
```
                    
Upon generating the above commands your environment specific database
is ready to be used. If you make any changes to the underlying Models
of your application you must run the migration script again to
apply the modifications:
```sh
$ rake db:migrate RAILS_ENV=[development,test,production]
```

###How to run the test suite
```shell script
$ bundle rake
```

##Services (job queues, cache servers, search engines, etc.)
In order to run the Puma webserver run the following command:
```shell script
$ bundle exec puma
```

## Deployment instructions
The following instructions are deploying to a Heroku instance.

The following instructions are for a Mac development 
environment to deploying to Heroku. It's assumed
the Mac package manager Brew is installed. If you're not
using Brew then follow the ['Installation Instructions'](https://docs.brew.sh/Installation)
    
For more detalied instructions see the ['Heroku CLI'](https://devcenter.heroku.com/articles/heroku-cli0) page.

Run the following commands:
```shell script
$ brew tap heroku/brew && brew install heroku
```
The following will produce a valid CLI version
```shell script
$ heroku --version
```
The following establishs a session in Heroku
```
$ heroku login
```
Now you have an active login into your Heroku account.
Next change to the root directory of your application.
```shell script
$ cd ~/myapp
```    
The following will create your application in Heroku:
```shell script
$ herolu create
```
The following verifies that a Git remote named 'heroku' has been
configured on your system.
```shell script
$ git config --list | grep heroku
```
To push your code from your 'master' branch to your Heroku instance:
```shell script
$ git push heroku master
```    
See [Heroku+Git](https://devcenter.heroku.com/articles/git) for more 
detailed instrucitons and trouble shooting.

###Creating a database in Heroku   
The following execution of Rake tasks will create your database
in Heroku:
```shell script
$ heroku run rake db:setup
$ heroku run rake db:migrate  
``` 

###Scaling web instances in Heroku
To scale or spin up a web instance(e.g. to 1 instance) 
run the following command:
```shell script
$ heroku ps:scale web=1
```