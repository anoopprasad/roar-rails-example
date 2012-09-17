require 'pp'

class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :debug_request
  after_filter :debug_response

  def debug_request
    puts "******* GOT REQUEST ********"
    #pp request
    puts "params=#{params.inspect}"
    puts "request.body=#{request.body.read.inspect}"
    puts "****************************"
  end

  def debug_response
    puts "********* RESPONSE *********"
    #pp response
    puts "response.body=#{response.body.inspect}"
    puts "****************************"
  end
end
