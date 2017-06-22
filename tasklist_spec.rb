# Story: As a developer, I can create a Task.
#
# Story: As a developer, I can give a Task a title and retrieve it.
#
# Story: As a developer, I can give a Task a description and retrieve it.
#
# Story: As a developer, I can mark a Task done.
#
# Story: As a developer, when I print a Task that is done, its status is shown.
# Hint: Implement to_s have it return the features of a Task with labels (for instance, "Title: Buy Food Description: Bananas, milk").
#
# Story: As a developer, I can add all of my Tasks to a TaskList.
# Hint: A TaskList has-many Tasks
#
# Story: As a developer with a TaskList, I can get the completed items.
#
# Story: As a developer with a TaskList, I can get the incomplete items.

require "rspec"
require_relative "tasklist"


describe Task do
  it "should be a task" do
    expect{Task.new}.to_not raise_error
  end
  it "should have a title" do
    task1 = Task.new ("test_title")
    expect(task1.title).to eq("test_title")
  end
  it "should have a description" do
    task1 = Task.new.add_description("test_description")
    expect(task1).to eq("test_description")
  end
  it "should be able to tell if task is done" do
    task1 = Task.new
    task1.mark_done
    expect(task1.done).to be true
  end
  it "is a task with labels" do
    task1 = Task.new
    task1.add_description("describe")
    expect(task1.info).to be_a String
  end
end

describe Tasklist do
  it "should be a tasklist" do
    expect{Tasklist.new}.to_not raise_error
  end
  it "can hold tasks" do
    task1 = Task.new("test1")
    task1.add_description("describe")
    list1 = Tasklist.new
    list1.add_task(task1)
    expect(list1.show_list).to match_array([task1])
  end
  it "should show completed tasks" do
    task1 = Task.new
    task1.mark_done
    task2 = Task.new
    task3 = Task.new
    task3.mark_done
    list1 = Tasklist.new
    list1.add_task(task1)
    list1.add_task(task2)
    list1.add_task(task3)
    expect(list1.show_completed).to match_array([task1, task3])
  end
  it "should show incomplete tasks" do
    task1 = Task.new
    task1.mark_done
    task2 = Task.new
    task3 = Task.new
    task3.mark_done
    list1 = Tasklist.new
    list1.add_task(task1)
    list1.add_task(task2)
    list1.add_task(task3)
    expect(list1.show_incomplete).to match_array([task2])
  end
end
