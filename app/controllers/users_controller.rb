class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      login(params[:user][:username],
            params[:user][:password],
            1)
      redirect_to root_url, notice: "Successfully signed up."
    else
      flash.now.alert = "You must correct the errors before you can sign up."
      render :new
    end
  end
end
