todos = [
  ["Send invoice", "money"],
  ["Clean room", "organize"],
  ["Pay rent", "money"],
  ["Arrange books", "organize"],
  ["Pay taxes", "money"],
  ["Buy groceries", "food"],
]

resultant_arr = []

todos.each_index {
  |ind|
  tup = todos[ind]
  text = tup[0]
  category = tup[1]
  categorized_vector = resultant_arr.find {
    |elem|
    elem[0] == category
  }

  if categorized_vector
    categorized_vector[1].push text
  else
    resultant_arr.push([category, [text]])
  end
}

resultant_arr.each {
  |cat_and_todos|
  puts "#{cat_and_todos[0]}:"
  cat_and_todos[1].each {
    |todo|
    puts "  #{todo}"
  }
}
