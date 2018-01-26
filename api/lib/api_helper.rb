require 'project_service'

module ProjectsApi
  module ApiHelper
    def project_service
      @project_service ||= ProjectService.new
    end
  end
end