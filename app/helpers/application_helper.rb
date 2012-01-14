module ApplicationHelper
  def bootstrap_form_for(object, options={}, &block)
    options[:builder] = BootstrapFormBuilder
    form_for(object, options, &block)
  end

  def cancel_button(options={path: root_path})
    link_to "Cancel", options[:path], class: "btn"
  end
  
  def flash_messages
    return content_tag(:div, flash[:alert], class: "alert-message error") if flash[:alert]
    return content_tag(:div, flash[:notice], class: "alert-message success") if flash[:notice]
  end

  # In a view, use `<% breadcrumbize array, of, links %>` to build the
  # breadcrumbs. "Home" is already given, so just specify what comes after.
  def breadcrumbize(*crumbs)
    @breadcrumbs = [*crumbs]
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

  def month_year(date)
    date.strftime("%b %Y")
  end

  def profile_for(user)
    link_to user, user
  end

end
