def get_command_line_argument
  # ARGV is an array that Ruby defines for us,
  # which contains all the arguments we passed to it
  # when invoking the script from the command line.
  # https://docs.ruby-lang.org/en/2.4.0/ARGF.html
  if ARGV.empty?
    puts "Usage: ruby lookup.rb <domain>"
    exit
  end
  ARGV.first
end

# `domain` contains the domain name we have to look up.
domain = get_command_line_argument

# File.readlines reads a file and returns an
# array of string, where each element is a line
# https://www.rubydoc.info/stdlib/core/IO:readlines
dns_raw = File.readlines("zone")

# ..
# ..
# FILL YOUR CODE HERE

def parse_dns(dns_raw)
  valid_records = dns_raw[1..].select {
    |record|
    record != "\n" && record != ""
  }
  mappings = {}

  valid_records = valid_records.each {
    |string|
    string = string.strip
    splitted = string.split(", ")

    domain = splitted[-1].split("\n")[0]

    mappings[splitted[1].to_sym] = {
      :type => splitted[0],
      :domain => domain,
    }
  }

  return mappings
end

def resolve(dns_records, lookup_chain, domain)
  suspect = dns_records[domain.to_sym]
  if suspect == nil
    puts "Error: record not found for #{domain}"
    return []
  elsif suspect[:type] == "A"
    lookup_chain.push(suspect[:domain])
    return lookup_chain
  else
    lookup_chain.push(suspect[:domain])
    return resolve(dns_records, lookup_chain, suspect[:domain])
  end
end

# ..
# ..

# To complete the assignment, implement `parse_dns` and `resolve`.
# Remember to implement them above this line since in Ruby
# you can invoke a function only after it is defined.
dns_records = parse_dns(dns_raw)
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
puts lookup_chain.join(" => ")
