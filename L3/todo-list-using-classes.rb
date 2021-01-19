require "date"

class Todo
  # ..
  # ..
  # FILL YOUR CODE HERE
  # ..
  # ..

  def initialize(text, due_date, completed)
    @text = text
    @due_date = due_date
    @completed = completed
  end

  # def text
  #   @text
  # end

  def over_due?
    @due_date < Date.today
  end

  def due_at_today?
    @due_date == Date.today
  end

  def upcoming?
    @due_date > Date.today
  end

  def to_displayable_string
    today = Date.today
    # FILL YOUR CODE HERE
    # if @completed
    return "[#{(@completed) ? "x" : " "}] #{@text} #{(!due_at_today?) ? @due_date : ""}"
  end
end

class TodosList
  def initialize(todos)
    @todos = todos
  end

  # ..
  # ..
  # FILL YOUR CODE HERE
  # ..
  # ..

  # Returns todos that are

  # - overdue.
  def overdue
    TodosList.new(@todos.filter { |todo| todo.over_due? })
  end

  # - Due at today.
  def due_today
    TodosList.new(@todos.filter { |todo| todo.due_at_today? })
  end

  # - Due at a later date.
  def due_later
    TodosList.new(@todos.filter { |todo| todo.upcoming? })
  end

  # Adds a todo to the current list.
  def add(todo)
    @todos.push(todo)
  end

  # def todos
  #   @todos
  # end

  # Returns an array of string formatted todos
  def to_displayable_list
    # FILL YOUR CODE HERE.
    @todos.map { |todo| todo.to_displayable_string }
  end
end

date = Date.today
todos = [
  { text: "Submit assignment", due_date: date - 1, completed: false },
  { text: "Pay rent", due_date: date, completed: true },
  { text: "File taxes", due_date: date + 1, completed: false },
  { text: "Call Acme Corp.", due_date: date + 1, completed: false },
]

todos = todos.map { |todo|
  Todo.new(todo[:text], todo[:due_date], todo[:completed])
}

todos_list = TodosList.new(todos)

todos_list.add(Todo.new("Service vehicle", date, false))

puts "My Todo-list\n\n"

puts "Overdue\n"
puts todos_list.overdue.to_displayable_list
puts "\n\n"

puts "Due Today\n"
puts todos_list.due_today.to_displayable_list
puts "\n\n"

puts "Due Later\n"
puts todos_list.due_later.to_displayable_list
puts "\n\n"
