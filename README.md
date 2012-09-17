roar-rails-example
=====

A sample application that shows how you can use [roar-rails][roar-rails] to provide JSON APIs in your controllers, with a test interface that does GETs, POSTs, PUTs, and DELETEs with two example models: Company and Employee.

There is an initializer that will populate a local SQLite database with sample data when the server starts. It won't try to populate unless the schema has been created, and will warn you if the schema is not setup.

This is meant to be a barebones example. For a more complete example, please see [elvanja/roar_example][roar_example].

### Setup

After installing Ruby 1.9.3 and Rails 3.2.x:

    git clone https://github.com/garysweaver/roar-rails-example.git
    cd roar-rails-example
    bundle install
    rake db:migrate
    rails s

Then browse to: [http://localhost:3000/][localhost]

### License

Copyright (c) 2012 Gary S. Weaver, released under the [MIT license][lic].

[roar-rails]: https://github.com/apotonick/roar-rails
[roar_example]: https://github.com/elvanja/roar_example
[localhost]: http://localhost:3000/
[lic]: http://github.com/garysweaver/roar-rails-example/blob/master/LICENSE
