names = [
  ["Jhumpa", "Lahiri"],
  ["J. K", "Rowling"],
  ["Devdutt", "Pattanaik"],
]

new_arr = []

names.each { |name_arr| new_arr.push(name_arr.join(" ")) }

new_arr.each { |elem| puts elem }
# print (new_arr.to_s +"\n")
