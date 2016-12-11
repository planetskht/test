class ManageUsersController < ApplicationController
	before_filter :require_user
	
	def index
	  if current_user && current_user.role == "Admin"
	  	@users = User.all
	  else
	  	redirect_to root_path, warn: 'Please contact Admin to access this page'
	  end
	  
	end

	def update
	  @user = User.find(params[:id])
	  @user.role = params[:user][:role]
	  @user.save
	  redirect_to manage_users_path, notice: 'Role was successfully updated.'
	end

end
