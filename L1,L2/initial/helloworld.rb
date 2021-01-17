# print("hello world")

puts("hello world")
puts("hello world")

class PoorlyFormattedClass
  attr_reader :title, :author

  def initialize(title, author)
    @title = title
    @author = author
  end

  def someMethod
    "1"
  end

  def newmethod
    return "hello universe"
  end
end

x = PoorlyFormattedClass.new("new title", "new_author")

puts(x.title, x.author)

for x in 1..5
  puts x
end

num = 5
10.times { |i| print "%d " % [num * i] }
