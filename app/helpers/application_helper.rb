module ApplicationHelper

  def show_status
    values = @health.map { |k,v| "#{k}: #{v}" }
    status = values.join('<br/>')
    status.html_safe
  end
end
