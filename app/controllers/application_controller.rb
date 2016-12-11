class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :require_user
  
  def set_parents
    @project = Project.find(params[:project_id])
    @sub_project = @project.sub_projects.find(params[:sub_project_id])
  end

  def require_user
  	unless current_user
      flash[:error] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
  end
end
