# Blog App

An assignment through [The Odin Project](https://www.theodinproject.com/lessons/ruby-on-rails-blog-app) which has us follow along with [The ruby on Rails Guides: Getting Started](https://guides.rubyonrails.org/getting_started.html), sections 1-11. We were advised to skip section 9.2 (on concerns) as it has been causing issues.

The goal here was to get a feel for the process of creating a simple Rails application-- to see how the components of MVC talk to each other, and experiment with some of these new methods. A minor goal was to practice deploying with Heroku.

My implementation follows the recommendations of the tutorial with the addition of a header on each page linking back to the root page, rework of the way comments on an article appear, and some basic html formatting like <br> tags.

## Using Postgresql

In order to deploy with Heroku, I needed to switch from sqlite3 to postgresql. This took a number of steps and patience. I'll document the steps taken here for reference:
- Installed the PostgreSQL database locally
- Replaced gem 'sqlite3' with gem 'pg' in Gemfile, ran bundle install.
- Modified config/database.yml to declare postgresql as the adapter, and gave new unique database names for development, test, and production.
- creating the database with rake db:create returned "FATAL: role "pythonikk" does not exist". I logged into the psql console as postgres with command: sudo su - postgres. Then i created a user matching my Ubuntu username and set that as the owner with command: createuser pythonikk. Then ran: createdb -) pythonikk pythonikk.
- This got me closer but was still getting a permissions denied error. I called up the psql console with interactive flag: sudo -u postgres - i, entered psql, then gave command "ALTER USER pyhtonikk CREATEDB;". Bam, permission to create db granted.
- rake db:create
- rake db:migrate 

## Styling

I did want to add some simple css and got the index page looking nice putting css in assets/stylesheets/application.css, but while trying to use other stylesheets for the other pages I learned that there is some stuff to know about the asset pipeline before throwing stuff in that directory. There is an Odin lesson on that very topic coming up soon so ill add to this project as i can.