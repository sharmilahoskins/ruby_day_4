require_relative "tasklist"
require 'date'
class DueDateTask< Task
  def initialize(title= "title")
    super
    @title = title
    @due_date
    @info
  end
  def due_date
    @due_date
  end
  def set_date(year, month, day)
    @due_date = Date.new(year, month, day)
  end
  def info
    @info = "#{@title}: #{@description}  Due date: #{@due_date} Is task done?  #{@done}"
  end
end
