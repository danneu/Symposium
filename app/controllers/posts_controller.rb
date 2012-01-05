class PostsController < ApplicationController
  load_and_authorize_resource :topic
  load_and_authorize_resource :post, through: :topic

  def show
  end

  def new
  end

  def create
    @post.creator = current_user
    if @post.save
      redirect_to forum_topic_path(@topic.forum, @topic), notice: "Successfully posted."
    else
      flash.now.alert = "Post was not created due to errors."
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(params[:post])
      redirect_to [@topic.forum, @topic], notice: "Post successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to [@topic.forum, @topic], notice: "Post deleted."
  end
end
