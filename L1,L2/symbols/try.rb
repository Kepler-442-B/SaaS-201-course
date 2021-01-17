str = "sample string"

new_str = :str

for x in 1..10
  new_str = :str
  puts new_str.object_id
  puts "hey"
end

x = 1..100

print [*x].join(" ")
