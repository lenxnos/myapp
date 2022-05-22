class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "You have successfully logged in"
      redirect_to user
    else
      flash.now[:alert] = 'There was something wrong with your login details'
      render 'new'
    end
  end

  def destroy
    # Remove the user id from the session
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    return redirect_to after_sign_out_path_for(root_path), status: :see_other
  end
end