class Admin::UsersController < Admin::ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :archive]

  def index
    @users = User.order(:email)
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user= User.new(user_params)
    if @user.save
      redirect_to(admin_users_path, :notice => "User has been created.")
    else
      flash.now[:alert] = "User has not been created."
      render "new"
    end
  end

  def edit
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
    end
    if @user.update(user_params)
      redirect_to(admin_users_path, :notice => "User has been updated.")
    else
      flash.now[:alert] = "User has not been updated."
      render "edit"
    end
  end

  def archive
    @user.archive
    redirect_to(admin_users_path, :notice => "User has been archived.")
  end

private
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end

end
