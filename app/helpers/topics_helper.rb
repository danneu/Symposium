module TopicsHelper
  def new_topic_link
    link_to "New Reply", new_topic_post_path(@topic), class: "btn primary"
  end

end
