require "active_record"

class Todo < ActiveRecord::Base
  def due_today?
    due_date == Date.today
  end

  def overdue?
    due_date < Date.today
  end

  def upcoming?
    due_date > Date.today
  end

  def self.get_overdues
    all.filter { |todo| todo.overdue? }
  end

  def self.get_today
    all.filter { |todo| todo.due_today? }
  end

  def self.get_upcoming
    all.filter { |todo| todo.upcoming? }
  end

  def to_displayable_string
    completed_string = completed ? "[x]" : "[ ]"
    date_string = due_today? ? "" : "#{due_date}"
    "#{id}. #{completed_string} #{todo_text} #{date_string}"
  end

  def self.to_displayable_list
    all.map { |todo| todo.to_displayable_string }
  end

  def self.get_displayable_list(todo_list)
    todo_list.map { |todo| todo.to_displayable_string }
  end

  def self.show_list
    puts "My Todo-list"
    puts "\n\n"

    puts "Overdue"
    puts Todo.get_displayable_list(Todo.get_overdues)

    puts "\n\n"

    puts "Due Today"
    puts Todo.get_displayable_list(Todo.get_today)
    puts "\n\n"

    puts "Due Later"
    puts Todo.get_displayable_list(Todo.get_upcoming)
    puts "\n\n"
  end

  def self.add_task(task)
    Todo.create!(todo_text: task[:todo_text], due_date: Date.today + task[:due_in_days], completed: false)
  end

  def self.mark_as_complete!(todo_id)
    todo = Todo.find(todo_id)
    todo.completed = true
    todo.save
    return todo
  end
end
