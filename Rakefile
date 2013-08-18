require 'rake'

# Include all rake files in the tasks directory
Dir.glob('tasks/*.rake').each { |r| import r }

task :default => 'install'

# Default utility functions available in all tasks
def ok_failed(condition)
  if (condition)
    puts "OK"
  else
    puts "FAILED"
  end
end

def get_stdin(message)
  print message
  STDIN.gets.chomp
end

def ask(message, valid_options)
  if valid_options
    answer = get_stdin("#{message} #{valid_options.to_s.gsub(/"/, '').gsub(/, /,'/')} ") while !valid_options.include?(answer)
  else
    answer = get_stdin(message)
  end
  answer
end

def mac?
  (/darwin/ =~ RUBY_PLATFORM) != nil
end

def windows?
  (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
end

def unix?
  not windows?
end

def linux?
  unix? and not mac?
end
