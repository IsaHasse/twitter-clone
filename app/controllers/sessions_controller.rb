class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user.present? && user.password_digest == session_params[:password_digest]
      session[:user_id] = user_id
      redirect_to root_path
    else
      redirect_to login_path, alert: 'Email or password is invalid!'
    end
  end

  def destroy
    session[:user_id] = nil
    @current_user     = nil

    redirect_to login_path, notice: 'Logged out!'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password_digest)
  end
end
