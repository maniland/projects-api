$LOAD_PATH.unshift *Dir[File.join(File.dirname(__FILE__), '../api/**/')]
$LOAD_PATH.unshift *Dir[File.join(File.dirname(__FILE__), '../api/*')]

require 'base_api'

run ProjectsApi::BaseApi.new