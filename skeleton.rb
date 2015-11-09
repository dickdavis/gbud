# ruby-project-skeleton script
# Copyright 2015 Richard Davis GPL v3
require 'fileutils'

# series of loops that extract required information
loop do
  print 'Project name => '
  @p_name = gets.chomp.to_s
  puts "You have entered: #{@p_name}"
  print 'Is this correct? (Y/N) => '
  u_verify = gets.chomp.to_s
  break if u_verify == 'Y' || u_verify == 'y'
end

loop do
  print 'Version number => '
  @version = gets.chomp.to_s
  puts "You have entered: \"#{@version}\""
  print 'Is this correct? (Y/N) = >'
  u_verify = gets.chomp.to_s
  break if u_verify == 'Y' || u_verify == 'y'
end

loop do
  print 'Project authors separated by a comma => '
  a_raw = gets.chomp.to_s
  @authors = a_raw.split(', ')
  puts "You have entered: \"#{@authors}\""
  print 'Is this correct? (Y/N) => '
  u_verify = gets.chomp.to_s
  break if u_verify == 'Y' || u_verify == 'y'
end

loop do
  print 'Project email => '
  @email = gets.chomp.to_s
  puts "You have entered: \"#{@email}\""
  print 'Is this correct? (Y/N) => '
  u_verify = gets.chomp.to_s
  break if u_verify == 'Y' || u_verify == 'y'
end

loop do
  print 'Project website => '
  @site = gets.chomp.to_s
  puts "You have entered: \"#{@site}\""
  print 'Is this correct? (Y/N) =>'
  u_verify = gets.chomp.to_s
  break if u_verify == 'Y' || u_verify == 'y'
end

loop do
  print 'Enter a short summary of the project => '
  @summary = gets.chomp.to_s
  puts "You have entered: \"#{@summary}\""
  print 'Is this correct? (Y/N) =>'
  u_verify = gets.chomp.to_s
  break if u_verify == 'Y' || u_verify == 'y'
end

loop do
  print 'Enter a description of the project => '
  @description = gets.chomp.to_s
  puts "You have entered: \"#{@description}\""
  print 'Is this correct? (Y/N) =>'
  u_verify = gets.chomp.to_s
  break if u_verify == 'Y' || u_verify == 'y'
end

loop do
  print 'Project\'s license => '
  @license = gets.chomp.to_s
  puts "You have entered: \"#{@license}\""
  print 'Is this correct? (Y/N) =>'
  u_verify = gets.chomp.to_s
  break if u_verify == 'Y' || u_verify == 'y'
end

# sets up directory structure
puts '*' * 10
puts 'Making directories...'
puts '*' * 10 + "\n"

FileUtils.mkdir_p([
  "#{@p_name}/bin/#{@p_name}",
  "#{@p_name}/lib/#{@p_name}",
  "#{@p_name}/test"
])

puts '*' * 10
puts 'Directories created successfully.'
puts '*' * 10 + "\n"

# creates initial files
puts '*' * 10
puts 'Making files...'
puts '*' * 10 + "\n"

File.open("#{@p_name}/lib/#{@p_name}.rb", 'w+') do
  puts "require '#{@p_name}/base'"
end

File.new("#{@p_name}/lib/#{@p_name}/version.rb", 'w+') do
  puts "module #{@p_name}"
  puts "\tVERSION = #{@version}"
  puts 'end'
end

puts '*' * 10
puts 'Files created successfully.'
puts '*' * 10 + "\n"

# writes gemspec
puts '*' * 10
puts 'Writing gemspec...'
puts '*' * 10 + "\n"

gemspec = File.new("#{@p_name}/#{@p_name}.gemspec", 'w+')
gemspec.puts '# -*- encoding: utf-8 -*-'
gemspec.puts "lib = File.expand_path('../lib', __FILE__)"
gemspec.puts "$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)\n"
gemspec.puts "require '#{@p_name}/version'\n"
gemspec.puts 'Gem::Specification.new do |s|'
gemspec.puts "\ts.name          = \"#{@p_name}\""
gemspec.puts "\ts.version       = #{@p_name}::VERSION"
gemspec.puts "\ts.platform      = Gem::Platform::RUBY"
gemspec.puts "\ts.authors       = #{@authors}"
gemspec.puts "\ts.email         = #{@email}"
gemspec.puts "\ts.homepage      = #{@site}"
gemspec.puts "\ts.summary       = #{@summary}"
gemspec.puts "\ts.description   = #{@description}"
gemspec.puts "\ts.license       = #{@license}"
gemspec.puts "\ts.files         = ['lib/#{@p_name}.rb']"
gemspec.puts "\ts.executables   = ['bin/#{@p_name}']"
gemspec.puts "\ts.test_files    = ['test/test_#{@p_name}.rb']"
gemspec.puts "\ts.require_path  = ['lib']"
gemspec.puts 'end'

puts '*' * 10
puts 'Gemspec written successfully.'
puts '*' * 10 + "\n"
