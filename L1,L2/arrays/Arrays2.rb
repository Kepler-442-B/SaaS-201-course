books = ["Design as Art", "Anathem", "Shogun"]
authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]

books_authors_strings = []

books.map.with_index { |book, index| books_authors_strings.push "#{book} was written by #{authors[index]}" }

books_authors_strings.each { |book_string| puts book_string }
