require 'grape'
require 'api_helper'

class ProjectApi < Grape::API

  helpers ApiHelper
  format :json

  rescue_from :all do |e|
    puts "#{e.message}\n\n#{e.backtrace.join("\n")}"
    Grape::API.logger.error "#{e.message}\n\n#{e.backtrace.join("\n")}"
    Rack::Response.new({ message: e.message, backtrace: e.backtrace }, 500, { 'Content-type' => 'application/json' }).finish
  end

  resource :project

  params do
    requires :id, type: String, desc: 'the category id'
  end
  get ':id' do
    propject_service.get_with params[:id]
  end
end