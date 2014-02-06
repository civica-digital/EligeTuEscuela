module ApplicationHelper
  def errors_on_resource_for_field(resource, field)
    unless resource.errors[field].empty?
      content_tag :div, resource.errors[field].join('<br/> ').html_safe, class: 'errors-form'
    end
  end

end
