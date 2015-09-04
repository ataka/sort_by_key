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

# options
def get_options()
  if /--(?<option>.+)/ =~ ARGV[1]
    if option == "new-key"
      return 'newkey'
    end
  end
  return false
end

def main()
  option = get_options()
  hash = Hash.new()

  arg = 0
  arg += 1 if option != false
  template = ARGV[arg]
  arg += 1
  data     = ARGV[arg]

  load_data(data,hash)
  sort_by_keys(template,hash)
  print_no_keys(hash)
end

main
