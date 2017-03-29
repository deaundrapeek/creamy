class SessionsController < ApplicationController
  def new

  end

  def create
    if !User.find_by(name: params[:user][:name].downcase).try(:authenticate, params[:user][:password])
      flash.now.alert = "invalid login"
      redirect_to "/login"
    else
      @user = User.find_by(name: params[:user][:name].downcase)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end

  private

  def session_params
    params.require(:user).permit(:name)
  end
end
