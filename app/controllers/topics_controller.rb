class TopicsController < ApplicationController
  load_and_authorize_resource :forum
  load_and_authorize_resource :topic, through: :forum

  def show
  end

  def new
  end

  def create
    if @topic.save
      redirect_to forum_topic_path(@forum, @topic)
    else
      flash.now.alert = "Errors"
      render :new
    end
  end

  def edit
  end

  def update
    if @topic.update_attributes(params[:topic])
      redirect_to [@forum, @topic], notice: "Topic successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to @forum, notice: "Successfully destroyed topic."
  end


end
