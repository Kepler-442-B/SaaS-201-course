todos = [
  ["Send invoice", "money"],
  ["Clean room", "organize"],
  ["Pay rent", "money"],
  ["Arrange books", "organize"],
  ["Pay taxes", "money"],
  ["Buy groceries", "food"],
]

todo_map = {}

todos.each {
  |todo_text, category|
  if todo_map[:"#{category}"]
    todo_map[:"#{category}"].push todo_text
  else
    todo_map[:"#{category}"] = [todo_text]
  end
}

todo_map.each do |cat, todos|
  puts "#{cat} --> #{todos}"
end
