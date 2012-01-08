class TopicsController < ApplicationController
  load_and_authorize_resource :forum
  load_and_authorize_resource :topic, through: :forum

  def show # FIXME: Why aren't  posts ordered by id on heroku?
    @posts = @topic.posts.order('id')
  end

  def new
    @post = @topic.posts.build
  end

  def create
    @topic.creator = current_user 
    @topic.posts.first.creator = current_user
    if @topic.save
      redirect_to forum_topic_path(@forum, @topic), notice: "Topic created successfully."
    else
      flash.now.alert = "Topic was not created."
      render :new
    end
  end

  def edit
    @post = @topic.posts.first
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
