#<%= bootstrap_form_for @project do |f| %>
  #<%= f.text_field :name, class: "span7" %>
  #<%= f.text_area :description, rows: 8, class: "span7" %>
  #<%= f.check_box :active %>

  #<%= f.div class: "actions" do %>
    #<%= f.submit %>
    #<%= link_to "Cancel", projects_path, class: "btn danger" %>
  #<% end %>
#<% end %>

class BootstrapFormBuilder < ActionView::Helpers::FormBuilder

  delegate :capture, :content_tag, :tag, to: :@template
  
  %w[email_field text_field text_area password_field collection_select].each do |method_name|
    define_method(method_name) do |name, *args|
      errors = object.errors[name].any? ? " error" : ""
      error_msg = object.errors[name].any? ? content_tag(:span, object.errors[name].join(","), class: "help-inline") : ""
    
      content_tag :div, class: "clearfix#{errors}" do
        field_label(name, *args) + content_tag(:div, class: "input#{errors}") do
          super(name, *args) + " " + error_msg
        end
      end
    end
  end

  def check_box(name, *args)
    content_tag :div, class: "clearfix" do
      content_tag(:div, class:"input") do
        content_tag(:ul, class:"inputs-list") do
          content_tag(:li) do
            content_tag(:label) do
              super(name, *args) + content_tag(:span) do
                field_label(name, *args)
              end
            end
          end
        end
      end
    end
  end
  
  
  def div(*args, &block)
    options = args.extract_options!
    data = block_given? ? capture(&block) : ''
    content_tag(:div, data, class: options[:class])
  end
  
  
  def submit(*args)
    super(*args, class: "btn primary")
  end

private

  def field_label(name, *args)
    options = args.extract_options!
    required = object.class.validators_on(name).any? { |v| v.kind_of? ActiveModel::Validations::PresenceValidator}
    label(name, options[:label], class: ("required" if required))
  end
  
  def objectify_options(options)
    super.except(:label)
  end
  
end

