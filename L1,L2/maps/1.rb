books = ["Design as Art", "Anathem", "Shogun", "how to take a penalty?"]
authors = ["Bruno Munari", "Neal Stephenson", "James Clavell", "bruno fernandes"]

book_author_map = {}

books.each_index {
  |idx|
  map_key = authors[idx].split(" ")[0].downcase
  if book_author_map[:"#{map_key}"] != nil
    book_author_map[:"#{map_key}"].push books[idx]
  else
    book_author_map[:"#{map_key}"] = [books[idx]]
  end
}

book_author_map.each do |key, val|
  puts "#{key} ==> #{val}"
end
