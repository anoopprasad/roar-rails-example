roar-rails-example
=====

*This example is under-construction. Some functionality may not work properly or at all.*

A sample application that shows how you can use [roar-rails][roar-rails] to provide JSON APIs in your controllers with two example models: Company and Employee. Assumes you will use curl or similar to test and provides sample commands.

For another example, see [elvanja/roar_example][roar_example], though I didn't test that.

### Setup

After installing Ruby 1.9.3 and Rails 3.2.x:

    git clone https://github.com/garysweaver/roar-rails-example.git
    cd roar-rails-example
    bundle install
    rake db:migrate
    rails s

Then browse to: [http://localhost:3000/][localhost]

### Parameter wrapping

Default Rails 3 way to handle is to change defaults in `config/initializers/wrap_parameters.rb`.

Note in the rails-api README it talks a little about wrap_parameters, if you are using `ActionController::API`.

### Testing with curl

    # create
    curl -v -H "Content-Type: application/json" -H "Accept: application/json" -X POST -d '{"name":"testing"}' http://localhost:3000/companies.json
    curl -v -H "Content-Type: application/json" -H "Accept: application/json" -X POST -d '{"name":"testing","company_id":1}' http://localhost:3000/employees.json
    # index
    curl -v -H "Content-Type: application/json" -H "Accept: application/json" -X GET http://localhost:3000/companies.json
    curl -v -H "Content-Type: application/json" -H "Accept: application/json" -X GET http://localhost:3000/employees.json
    # show
    curl -v -H "Content-Type: application/json" -H "Accept: application/json" -X GET http://localhost:3000/companies/1.json
    curl -v -H "Content-Type: application/json" -H "Accept: application/json" -X GET http://localhost:3000/employees/1.json
    # update
    curl -v -H "Content-Type: application/json" -H "Accept: application/json" -X PUT -d '{"name":"testing update"}' http://localhost:3000/companies/1.json
    curl -v -H "Content-Type: application/json" -H "Accept: application/json" -X PUT -d '{"name":"testing update"}' http://localhost:3000/employees/1.json
    # destroy
    curl -v -H "Content-Type: application/json" -H "Accept: application/json" -X DELETE http://localhost:3000/companies/1.json
    curl -v -H "Content-Type: application/json" -H "Accept: application/json" -X DELETE http://localhost:3000/employees/1.json

### Resetting data

At your own risk, do:

    rails c
    Employee.delete_all
    Contact.delete_all
    exit

### Problems

Does not actually set anything in consume! currently, so objects are unaltered from incoming request whether params are wrapped or not. May be version-specific issue or implementation issue.

### License

Copyright (c) 2012 Gary S. Weaver, released under the [MIT license][lic].

[roar-rails]: https://github.com/apotonick/roar-rails
[roar_example]: https://github.com/elvanja/roar_example
[localhost]: http://localhost:3000/
[lic]: http://github.com/garysweaver/roar-rails-example/blob/master/LICENSE
