# README

This README would normally document whatever steps are necessary to get the
application up and running.

== Welcome to IOT Thermostats

== Getting Started

Make sure you have Ruby version > = 2.2

Make sure you have Rails version > = 5.2.0

Make sure you have PostgreSQL installed in your maching >= 9.3


1. At the command prompt, create a new Rails application:
       <tt>rails new myapp --api</tt> (where <tt>myapp</tt> is the application name)

2. Change directory to <tt>myapp</tt> and start the web server:
       <tt>cd myapp; rails server</tt> (run with --help for options)

3. Go to http://localhost:3000/ and you'll see:
       "Welcome to Rails 5!"

4. Follow the guidelines to start developing your application. You can find
the following resources handy:

* The Getting Started Guide: http://guides.rubyonrails.org/getting_started.html
* Ruby on Rails Tutorial Book: http://www.railstutorial.org/


== Debugging Rails

Sometimes your application goes wrong. Fortunately there are a lot of tools that
will help you debug it and get it back on the rails.

First area to check is the application log files. Have "tail -f" commands
running on the server.log and development.log. Rails will automatically display
debugging and runtime information to these files. Debugging info will also be
shown in the browser on requests from 127.0.0.1.

You can also log your own messages directly into the log file from your code
using the Ruby logger class from inside your controllers. Example:

  class ThermoStatsController < ActionController::Base
    def destroy
      @stat = ThermoStat.find(params[:id])
      @stat.destroy
      logger.info("#{Time.now} Destroyed stat ID ##{@stat.id}!")
    end
  end

The result will be a message in your log file along the lines of:

  Mon Oct 08 14:22:29 +1000 2007 Destroyed stat ID #1!

More information on how to use the logger is at http://www.ruby-doc.org/core/

Also, Ruby documentation can be found at http://www.ruby-lang.org/. There are
several books available online as well:

* Programming Ruby: http://www.ruby-doc.org/docs/ProgrammingRuby/ (Pickaxe)
* Learn to Program: http://pine.fm/LearnToProgram/ (a beginners guide)

These two books will bring you up to speed on the Ruby language and also on
programming in general.


== Debugger

Debugger support is available through the debugger command when you start your
WEBrick server with --debugger.

So the controller will accept the action, run the first line, then present you
with a IRB prompt in the server window. Here you can do things like:



== Console

The console is a Ruby shell, which allows you to interact with your
application's domain model. Here you'll have all parts of the application
configured, just like it is when the application is running. You can inspect
domain models, change values, and save to the database. Starting the script
without arguments will launch it in the development environment.

To start the console, run <tt>rails console</tt> from the application
directory.

Options:

* Passing the <tt>-s, --sandbox</tt> argument will rollback any modifications
  made to the database.
* Passing an environment name as an argument will load the corresponding
  environment. Example: <tt>rails console production</tt>.

To reload your controllers and models after launching the console run
<tt>reload!</tt>

More information about irb can be found at:
link:http://www.rubycentral.org/pickaxe/irb.html


== Description of Contents

The default directory structure of a generated Ruby on Rails application:

  |-- app
  |   |-- channels
  |       |-- application_cable
  |         |-- channel.rb
  |         |-- connection.rb
  |   |-- controllers
  |   |-- jobs
  |   |-- mailers
  |   |-- models
  |   |-- views
  |       |-- layouts
  |-- config
  |   |-- environments
  |   |-- initializers
  |   |-- locales
  |-- db
  |-- lib
  |   |-- tasks
  |-- log
  |-- public
  |-- test
  |   |-- fixtures
  |   |-- functional
  |   |-- integration
  |   |-- performance
  |   |-- unit
  |-- tmp
  |   |-- cache
  |   |-- pids
  |   |-- sessions
  |   |-- sockets
  |-- vendor
      |-- assets
          |-- stylesheets
      |-- plugins

app
  Holds all the code that's specific to this particular application.

app/controllers
  Holds controllers that should be named like weblogs_controller.rb for
  automated URL mapping.

app/models
  Holds models that should be named like post.rb. Models descend from
  ActiveRecord::Base by default.

app/views
  Holds the template files for the view that should be named like
  weblogs/index.rabl.

config
  Configuration files for the Rails environment, the routing map, the database,
  and other dependencies.

db
  Contains the database schema in schema.rb. db/migrate contains all the
  sequence of Migrations for your schema.

lib
  Application specific libraries. Basically, any kind of custom code that
  doesn't belong under controllers, models, or helpers. This directory is in
  the load path.

public
  The directory available for the web server. Also contains the dispatchers and the
  default HTML files. This should be set as the DOCUMENT_ROOT of your web
  server.

script
  Helper scripts for automation and generation.

test
  Unit and functional tests along with fixtures.

vendor
  External libraries that the application depends on.

