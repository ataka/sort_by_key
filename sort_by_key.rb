#!/usr/bin/env ruby

module Options
  NONE   = 0
  NEWKEY = (1 << 0)
end

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
        print line unless has_option(options, Options::NEWKEY)
        next
      end

      key = line.chomp
      print str_key_value_pair(key, hash[key]) unless has_option(options, Options::NEWKEY)
      hash.delete(key)
    }
  }
end

def print_no_keys(hash)
  hash.each { |key,value|
    print str_key_value_pair(key, value)
  }
end

def str_key_value_pair(key,value)
  return "" << key << ' = ' << value << "\n"
end

def has_option(options,option)
  return (options & option) != Options::NONE
end

# options
def get_options()
  options = Options::NONE
  if /--(?<option>.+)/ =~ ARGV[0]
    if option == "new-key"
      options |= Options::NEWKEY
    end
  end
  return options
end

def main()
  options = get_options()
  hash = Hash.new()

  arg = 0
  arg += 1 if options != Options::NONE
  template = ARGV[arg]
  arg += 1
  data     = ARGV[arg]

  load_data(data,hash)
  sort_by_keys(template,hash,options)
  print_no_keys(hash)
end

main
