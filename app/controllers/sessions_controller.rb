class SessionsController < ApplicationController

  skip_before_filter :require_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      unless user.channels.empty?
        channel = user.channels.last
      redirect_to user_channel_path(user, user.channels.last), :notice => "Welcome Back #{user.first_name}"
      else
      redirect_to user_path(user)
      end
    else
      redirect_to new_user_path, :notice => "Invalid email/password combination"
    end
  end

  def destroy
    sign_out
    redirect_to new_user_path
  end
end
