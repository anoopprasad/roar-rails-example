roar-rails-example
=====

A sample application that shows how you can use roar-rails to enable controllers.

Currently only has a page that has links to four GET links to see JSON that test index and show on two prepopulated example models- employee and company, but you can do POST/PUT and DELETE to it also, i.e. it provides restful resource routing for JSON services for two prepopulated models.

There is an initializer that will populate a local SQLite database with sample data when the server starts. It won't try to populate unless the schema has been created, and will warn you if the schema is not setup.

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

[localhost]: http://localhost:3000/
[lic]: http://github.com/garysweaver/roar-rails-example/blob/master/LICENSE
