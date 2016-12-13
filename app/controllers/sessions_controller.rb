class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user
      if user.is_admin?
        redirect_to admin_home_path
      else
        redirect_to user
      end
    else
      flash[:danger] = t "flash.error"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
