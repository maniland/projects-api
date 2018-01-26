require 'grape'
require 'json'

module ProjectsApi
  class BaseApi < Grape::API
    get '/ping' do
      "pong"
    end
  end
end