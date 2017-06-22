require "rspec"
require_relative "due_date"
require_relative "tasklist"

# Story: As a developer, I can create a DueDateTask, which is-a Task that has-a due date.
# Hint: Use the built-in Ruby Date class
#
# Story: As a developer, I can print an item with a due date with labels and values.
# Hint: When implementing to_s, use super to call to_s on the super class.
#
# Story: As a developer, I can add items with due dates to my TaskList.
# Hint: Consider keeping items with due dates separate from the other items.
#
# Story: As a developer with a TaskList, I can list all the not completed items that are due today.
#
# Story: As a developer with a TaskList, I can list all the not completed items in order of due date.
#
# Story: As a developer with a TaskList with and without due dates, I can list all the not completed items in order of due date, and then the items without due dates.
describe DueDateTask do
  it "should be a task" do
    expect{DueDateTask.new}.to_not raise_error
  end
  it "should have a due date" do
    task = DueDateTask.new
    task.set_date(2017, 12, 12)
    expect(task.due_date).to be_a Date
  end
  it "should have info" do
    task = DueDateTask.new
    task.set_date(2017,12,12)
    expect(task.info).to be_a String
  end
end

describe Tasklist do
  it "can hold due date tasks" do
    task1 = DueDateTask.new
    task1.set_date(2017,12,12)
    tasklist = Tasklist.new
    tasklist.add_duedate_task(task1)
    expect(tasklist.duedate_list).to match_array([task1])
  end
  it "should show tasks due today" do
    task1 = DueDateTask.new("task1")
    task1.set_date(2017,06,22)
    task2 = DueDateTask.new("task2")
    task2.set_date(2017,07,13)
    task3 = DueDateTask.new("task3")
    task3.set_date(2017,06,22)
    tasklist = Tasklist.new
    tasklist.add_duedate_task(task1)
    tasklist.add_duedate_task(task2)
    tasklist.add_duedate_task(task3)
    expect(tasklist.show_due).to match_array([task1, task3])
  end
  it "should sort list list" do
    task1 = Task.new("task1")
    task1.mark_done
    task2 = Task.new("task2")
    task3 = Task.new("task3")
    task4 = DueDateTask.new("task4")
    task4.set_date(2014, 12, 22)
    task4.mark_done
    task5 = DueDateTask.new("task5")
    task5.set_date(2017, 07, 20)
    task6 = DueDateTask.new("task6")
    task6.set_date(2019, 05, 23)
    tasklist = Tasklist.new
    tasklist.add_task(task1)
    tasklist.add_task(task2)
    tasklist.add_task(task3)
    tasklist.add_duedate_task(task4)
    tasklist.add_duedate_task(task5)
    tasklist.add_duedate_task(task6)
    tasklist.show_incomplete
    expect(tasklist.sort_list_list).to match_array([task5, task6, task2, task3])
  end
end
