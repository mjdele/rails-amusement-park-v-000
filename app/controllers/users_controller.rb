class UsersController < ApplicationController
  before_action :require_logged_in, only: [:show]

  def new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to controller: 'users', action: 'new'
    end
  end

  def show
    @user = User.find_by(id: session[:user_id])
  end

  private
 
  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end
end
