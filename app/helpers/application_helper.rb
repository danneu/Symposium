module ApplicationHelper
  def bootstrap_form_for(object, options={}, &block)
    options[:builder] = BootstrapFormBuilder
    form_for(object, options, &block)
  end

  def cancel_button(options={path: root_path})
    link_to "Cancel", options[:path], class: "btn"
  end

end
