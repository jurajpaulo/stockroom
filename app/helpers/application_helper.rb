module ApplicationHelper
  def title(title = '')
      @title = title
  end

  # creates a sorting link (used in table headers), swapping asc/desc 
  def sortable(column, title = nil)
      title ||= column.titleize
      direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
      link_to title, :sort => column, :direction => direction
  end

  def error_messages errors
    if errors.any?
  		  render :partial => 'application/error_message', :locals => {:errors => errors}
  	end
  end
end
