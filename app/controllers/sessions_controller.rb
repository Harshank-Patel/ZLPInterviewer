class SesionsController < ApplicationController
  skip_before_action :require_login, only: [:create, :new]
  def create
    admin = Admin.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      session[:admin_id] = admin.id
      flash[:notice] = "Logged in successfully."
      redirect_to admin
    else
      flash.now[:alert] = "There was something wrong with your login details."
      render 'new'
    end
  end

  def destroy
    session[:admin_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to root_path
  end
end
