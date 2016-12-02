class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def set_parents
      @project = Project.find(params[:project_id])
      @sub_project = @project.sub_projects.find(params[:sub_project_id])
    end
end
