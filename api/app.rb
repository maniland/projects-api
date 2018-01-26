require 'sinatra'
require 'sinatra/cross_origin'
require 'rack/parser'
require 'json'

class ProjectsApi < Sinatra::Base
  use Rack::Parser
  register Sinatra::CrossOrigin

  set :show_exceptions, false

  attr_reader :client

  configure do
    enable :cross_origin
  end

  get '/ping' do
    "pong"
  end

end