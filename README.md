roar-rails-example
=====

*This example is under-construction. Some functionality may not work properly or at all.*

A sample application that shows how you can use [roar-rails][roar-rails] to provide JSON APIs in your controllers, with a test interface that does GETs, POSTs, PUTs, and DELETEs with two example models: Company and Employee.

There is an initializer that will populate a local SQLite database with sample data when the server starts. It won't try to populate unless the schema has been created, and will warn you if the schema is not setup.

For another example, see [elvanja/roar_example][roar_example].

### Setup

After installing Ruby 1.9.3 and Rails 3.2.x:

    git clone https://github.com/garysweaver/roar-rails-example.git
    cd roar-rails-example
    bundle install
    rake db:migrate
    rails s

Then browse to: [http://localhost:3000/][localhost]

### Parameter wrapping

Default Rails 3 way to handle is to change defaults in `config/initializers/wrap_parameters.rb`. Note in the rails-api README it talks a little about wrap_parameters, if you are using `ActionController::API` like in the example.

### Additional testing with curl

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

### Problems

Appears to be trying to execute show after create, but need to be able to return a different response from create, so can't use 
 
    #<ActionController::RoutingError: No route matches {:action=>"show", :controller=>"companies", :id=>nil}>
    /path/to/gems/gems/actionpack-3.2.6/lib/action_dispatch/routing/route_set.rb:532:in `raise_routing_error'
    /path/to/gems/gems/actionpack-3.2.6/lib/action_dispatch/routing/route_set.rb:528:in `rescue in generate'
    /path/to/gems/gems/actionpack-3.2.6/lib/action_dispatch/routing/route_set.rb:520:in `generate'
    /path/to/gems/gems/actionpack-3.2.6/lib/action_dispatch/routing/route_set.rb:561:in `generate'
    /path/to/gems/gems/actionpack-3.2.6/lib/action_dispatch/routing/route_set.rb:586:in `url_for'
    /path/to/gems/gems/actionpack-3.2.6/lib/action_dispatch/routing/url_for.rb:148:in `url_for'
    /path/to/gems/gems/actionpack-3.2.6/lib/action_dispatch/routing/route_set.rb:213:in `company_url'
    /path/to/projects/roar-rails-example/app/representers/company_representer.rb:15:in `block in <module:CompanyRepresenter>'
    /path/to/projects/roar/lib/roar/representer/feature/hypermedia.rb:63:in `instance_exec'
    /path/to/projects/roar/lib/roar/representer/feature/hypermedia.rb:63:in `run_link_block'
    /path/to/projects/roar/lib/roar/representer/feature/hypermedia.rb:56:in `block in prepare_links!'
    /path/to/projects/roar/lib/roar/representer/feature/hypermedia.rb:54:in `each'
    /path/to/projects/roar/lib/roar/representer/feature/hypermedia.rb:54:in `prepare_links!'
    /path/to/projects/roar/lib/roar/representer/feature/hypermedia.rb:37:in `before_serialize'
    /path/to/projects/roar/lib/roar/representer/json.rb:20:in `to_hash'
    /path/to/gems/gems/representable-1.2.5/lib/representable/json.rb:61:in `to_json'
    /path/to/gems/gems/actionpack-3.2.6/lib/action_controller/metal/renderers.rb:93:in `block in <module:Renderers>'
    /path/to/gems/gems/actionpack-3.2.6/lib/action_controller/metal/renderers.rb:35:in `block in _handle_render_options'
    /path/to/ruby-1.9.3-p194/lib/ruby/1.9.1/set.rb:222:in `block in each'
    /path/to/ruby-1.9.3-p194/lib/ruby/1.9.1/set.rb:222:in `each_key'
    /path/to/ruby-1.9.3-p194/lib/ruby/1.9.1/set.rb:222:in `each'
    /path/to/gems/gems/actionpack-3.2.6/lib/action_controller/metal/renderers.rb:32:in `_handle_render_options'
    /path/to/gems/gems/actionpack-3.2.6/lib/action_controller/metal/renderers.rb:28:in `render_to_body'
    /path/to/gems/gems/actionpack-3.2.6/lib/action_controller/metal/compatibility.rb:50:in `render_to_body'
    /path/to/gems/gems/actionpack-3.2.6/lib/abstract_controller/rendering.rb:88:in `render'
    /path/to/gems/gems/actionpack-3.2.6/lib/action_controller/metal/rendering.rb:16:in `render'
    /path/to/gems/gems/actionpack-3.2.6/lib/action_controller/metal/instrumentation.rb:40:in `block (2 levels) in render'
    /path/to/gems/gems/activesupport-3.2.6/lib/active_support/core_ext/benchmark.rb:5:in `block in ms'
    /path/to/ruby-1.9.3-p194/lib/ruby/1.9.1/benchmark.rb:295:in `realtime'
    /path/to/gems/gems/activesupport-3.2.6/lib/active_support/core_ext/benchmark.rb:5:in `ms'
    /path/to/gems/gems/actionpack-3.2.6/lib/action_controller/metal/instrumentation.rb:40:in `block in render'
    /path/to/gems/gems/actionpack-3.2.6/lib/action_controller/metal/instrumentation.rb:83:in `cleanup_view_runtime'
    /path/to/gems/gems/activerecord-3.2.6/lib/active_record/railties/controller_runtime.rb:24:in `cleanup_view_runtime'
    /path/to/gems/gems/actionpack-3.2.6/lib/action_controller/metal/instrumentation.rb:39:in `render'
    /path/to/gems/gems/actionpack-3.2.6/lib/action_controller/metal/responder.rb:254:in `display'
    /path/to/projects/roar-rails/lib/roar/rails/responder.rb:27:in `display'
    /path/to/gems/gems/actionpack-3.2.6/lib/action_controller/metal/responder.rb:204:in `api_behavior'
    /path/to/gems/gems/actionpack-3.2.6/lib/action_controller/metal/responder.rb:181:in `rescue in to_format'
    /path/to/gems/gems/actionpack-3.2.6/lib/action_controller/metal/responder.rb:175:in `to_format'
    /path/to/gems/gems/actionpack-3.2.6/lib/action_controller/metal/responder.rb:153:in `respond'
    /path/to/gems/gems/actionpack-3.2.6/lib/action_controller/metal/responder.rb:146:in `call'
    /path/to/gems/gems/actionpack-3.2.6/lib/action_controller/metal/mime_responds.rb:239:in `respond_with'
    /path/to/projects/roar-rails-example/app/controllers/companies_controller.rb:54:in `create'

### License

Copyright (c) 2012 Gary S. Weaver, released under the [MIT license][lic].

[roar-rails]: https://github.com/apotonick/roar-rails
[roar_example]: https://github.com/elvanja/roar_example
[localhost]: http://localhost:3000/
[lic]: http://github.com/garysweaver/roar-rails-example/blob/master/LICENSE
