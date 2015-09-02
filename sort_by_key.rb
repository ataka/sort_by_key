#!/usr/bin/env ruby

def load_data(data, hash)
  File.open(data, "r") { |f|
    f.each { |line|
      kv = line.split("=",2).map(&:strip)
      hash.store(kv[0], kv[1])
    }
  }
end

def sort_by_keys(template,hash)
  File.open(template, "r") { |f|
    f.each { |line|
      if line[0] != "\""
        print line
        next
      end

      key = line.chomp
      print key, " = ", hash[key], "\n"
      hash.delete(key)
    }
  }
end

def print_no_keys(hash)
  hash.each { |key,value|
    print key, " = ", value, "\n"
  }
end

def main()
  hash = Hash.new()
  load_data(ARGV[1],hash)
  sort_by_keys(ARGV[0],hash)
  print_no_keys(hash)
end

main
