class SessionsController < ApplicationController
  def create
    user = login(params[:username],
                 params[:password],
                 params[:remember_me])
    if user
      redirect_back_or_to root_url, success: "Successfully logged in."
    else
      flash.now[:error] = "Invalid username or password."
      render :new
    end
  end

  def destroy
    logout
    flash[:success] = "Successfully logged out."
    redirect_to root_url
  end
end
