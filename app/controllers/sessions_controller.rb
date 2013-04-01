class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_school_id(params[:session][:school_id])
  	if user && user.authenticate(params[:session][:password])
  	  sign_in user
  	  redirect_to user
  	else
  	  flash.now[:error] = 'Invalid school ID/password combination'
  	  render 'new'
  	end
  end

  def destroy
  	sign_out
    redirect_to root_path
  end
end
