module ApplicationHelper
  def bootstrap_form_for(object, options={}, &block)
    options[:builder] = BootstrapFormBuilder
    form_for(object, options, &block)
  end

  def cancel_button(options={path: root_path})
    link_to "Cancel", options[:path], class: "btn"
  end
  
  def flash_messages
    content_tag(:div, flash[:alert], class: "alert-message warning") if flash[:alert]
    content_tag(:div, flash[:notice], class: "alert-message success") if flash[:notice]
  end

  def breadcrumbize(&block)
    @breadcrumbs = yield
  end
  def breadcrumbs
    return '' if @breadcrumbs.nil?
    divider = content_tag(:span, "&raquo;".html_safe, class: "divider") 
    markup = ""
    markup << content_tag(:ul, class: "breadcrumb") do
      _markup = content_tag(:li, link_to("Home", root_path))
      @breadcrumbs.each do |crumb|
        _markup << divider
        _markup << content_tag(:li, raw(crumb))
      end
      _markup.html_safe
    end
    markup.html_safe
  end

end
