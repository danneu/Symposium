class ForumsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @forum.save
      redirect_to @forum, notice: 'Forum was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @forum.update_attributes(params[:forum])
      redirect_to @forum, notice: 'Forum was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  def destroy
    @forum.destroy
    flash[:success] = "Successfully destroyed forum."
    redirect_to forums_url
  end
end
