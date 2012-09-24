roar-rails-example
=====

A simple sample application that shows how you can use [roar-rails][roar-rails] to provide JSON APIs in your controllers with two example models: Company and Employee. Assumes you will use curl or similar to test and provides sample commands.

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

Per Nick, we don't have to send in `.json` because of the Accept header, which is the most RESTful way to pass in a format, despite Rails historically doing the path extension thing:

    # create
    curl -v -H "Content-Type: application/json" -H "Accept: application/json" -X POST -d '{"name":"testing"}' http://localhost:3000/companies
    curl -v -H "Content-Type: application/json" -H "Accept: application/json" -X POST -d '{"name":"testing","company_id":1}' http://localhost:3000/employees
    # index
    curl -v -H "Content-Type: application/json" -H "Accept: application/json" -X GET http://localhost:3000/companies
    curl -v -H "Content-Type: application/json" -H "Accept: application/json" -X GET http://localhost:3000/employees
    # show
    curl -v -H "Content-Type: application/json" -H "Accept: application/json" -X GET http://localhost:3000/companies/1
    curl -v -H "Content-Type: application/json" -H "Accept: application/json" -X GET http://localhost:3000/employees/1
    # update
    curl -v -H "Content-Type: application/json" -H "Accept: application/json" -X PUT -d '{"name":"testing update"}' http://localhost:3000/companies/1
    curl -v -H "Content-Type: application/json" -H "Accept: application/json" -X PUT -d '{"name":"testing update"}' http://localhost:3000/employees/1
    # destroy
    curl -v -H "Content-Type: application/json" -H "Accept: application/json" -X DELETE http://localhost:3000/companies/1
    curl -v -H "Content-Type: application/json" -H "Accept: application/json" -X DELETE http://localhost:3000/employees/1

### Resetting data

At your own risk, drop the sqlite db so that sequences and data are reset, otherwise the test curl commands may fail on some ids.

### License

Copyright (c) 2012 Gary S. Weaver, released under the [MIT license][lic].

[roar-rails]: https://github.com/apotonick/roar-rails
[roar_example]: https://github.com/elvanja/roar_example
[localhost]: http://localhost:3000/
[lic]: http://github.com/garysweaver/roar-rails-example/blob/master/LICENSE
