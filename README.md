== Welcome to IOT Thermostats

This README would normally document whatever steps are necessary to get the
application up and running.

== Getting Started

Make sure you have Ruby version - 2.5.1

Make sure you have Rails version > = 5.2.0

Make sure you have PostgreSQL installed in your maching >= 9.3 (suggested 9.4.5)

Make sure redis is installed (suggested - 3.0.6)


Follow the guidelines to setup this project on your local:

* Clone/Download this project.
* Run `bundle install` or `bundle install --local` command to install all the gems in *vendor/bundle* folder.
* Copy all `*.yml.sample` files in *config* folder and rename them as `*.yml` in the same folder.
* Rename Procfile.sample to Procfile and make sure to add desired configurations.
* Create, migrate and seed the database.
* Run `rake swagger:docs` command to generate the API Documentation.
* Start the server using `foreman start` and hit the home page using `localhost:3000` which is default.
* Make sure when swagger index page comes it has proper api-docs.json path (By default) .


Read below to know about the appliation:

== Debugging Rails

Sometimes your application goes wrong. Fortunately there are a lot of tools that
will help you debug it and get it back on the rails.

First area to check is the application log files. Have "tail -f development.log" commands.
Rails will automatically display
debugging and runtime information to these files. Debugging info will also be
shown in the browser on requests from 127.0.0.1.


== Console

The console is a Ruby shell, which allows you to interact with your
application's domain model. Here you'll have all parts of the application
configured, just like it is when the application is running. You can inspect
domain models, change values, and save to the database. Starting the script
without arguments will launch it in the development environment.

To start the console, run <tt>rails console</tt> from the application
directory.

To reload your controllers and models after launching the console run
<tt>reload!</tt>



== Description of Contents

The default directory structure of a generated Ruby on Rails application:

app
  Holds all the code that's specific to this particular application.

app/controllers
  Holds controllers that should be named like readings_controller.rb for
  automated URL mapping.

app/controllers/api/v1/
  Holds API controllers.

app/models
  Holds models that should be named like reading.rb. Models descend from
  ActiveRecord::Base by default.

app/serailizers
  To serialize data for APIs

app/views
  Holds the template files for the view that should be named like
  weblogs/index.rabl.

app/workers
  Holds background jobs.


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

logs
  To hold log files.

spec
  Unit and functional tests along with fixtures.

vendor
  External libraries that the application depends on.

