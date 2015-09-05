#!/usr/bin/env ruby

def load_data(data, hash)
  File.open(data, "r") { |f|
    f.each { |line|
      kv = line.split("=",2).map(&:strip)
      hash.store(kv[0], kv[1])
    }
  }
end

def sort_by_keys(template,hash,options)
  File.open(template, "r") { |f|
    f.each { |line|
      if line[0] != "\""
        print line unless options == 'newkey'
        next
      end

      key = line.chomp
      print key, " = ", hash[key], "\n" unless options == 'newkey'
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
  if /--(?<option>.+)/ =~ ARGV[0]
    if option == "new-key"
      return 'newkey'
    end
  end
  return false
end

def main()
  options = get_options()
  hash = Hash.new()

  arg = 0
  arg += 1 if options != false
  template = ARGV[arg]
  arg += 1
  data     = ARGV[arg]

  load_data(data,hash)
  sort_by_keys(template,hash,options)
  print_no_keys(hash)
end

main
