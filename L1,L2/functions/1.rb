def salute(full_name, greeting)
  last_name = full_name.split(" ")[-1].capitalize
  return "#{greeting.capitalize} Mr. #{last_name}"
end

puts salute("Nelson Rolihlahla Mandela", "hello")
puts salute("Sir Alan Turing", "welcome")
