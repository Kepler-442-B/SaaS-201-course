# puts "What do you wanna do ?"

# inp = gets.chomp

# # puts "#{inp} is what you wanna do."
# # this is a sample comment

# if inp == "hello"
#   puts "hello as well"
# elsif inp == "hai"
#   puts "hai to you"
# else
#   puts "i won't greet you"
# end

# nums = [2, 4, 200, 400]
# nums.each {|x| puts "The current number is #{x}" }

def get_companion(element)
  if element % 10 == 1
    return "st"
  elsif element % 10 == 2
    return "nd"
  elsif element % 10 == 3
    return "rd"
  else
    return "th"
  end
end

nums = [*1..110]
puts nums.find_all { |num| num % 4 == 0 }
nums.each_index { |index| puts "#{index + 1} #{get_companion(index + 1)} element is #{nums[index]}" }
