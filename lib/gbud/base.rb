# gbud base script
# Copyright 2015 Richard Davis GPL v3
require 'fileutils'
require './getinfo.rb'

p_name = GetInfo.user_prompt('Project name => ')
version = GetInfo.user_prompt('Version number => ')
authors = GetInfo.user_prompt('Authors separated by a comma => ').split(', ')
email = GetInfo.user_prompt('Project email => ')
site = GetInfo.user_prompt('Project website => ')
summary = GetInfo.user_prompt('Enter a short summary of the project => ')
description = GetInfo.user_prompt('Enter a description of the project => ')
license = GetInfo.user_prompt('Project\'s license => ')

# sets up directory structure
FileUtils.mkdir_p([
  "#{p_name}/bin/#{p_name}",
  "#{p_name}/lib/#{p_name}",
  "#{p_name}/test"
])

# creates initial files
File.open("#{p_name}/lib/#{p_name}.rb", 'w') do
  puts "require '#{p_name}/base'"
end

File.open("#{p_name}/lib/#{p_name}/version.rb", 'w') do
  puts "module #{p_name}"
  puts "\tVERSION = #{version}"
  puts 'end'
end

# writes gemspec
gemspec = File.new("#{p_name}/#{p_name}.gemspec", 'w+')
gemspec.puts '# -*- encoding: utf-8 -*-'
gemspec.puts "lib = File.expand_path('../lib', __FILE__)"
gemspec.puts "$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)\n\n"
gemspec.puts "require '#{p_name}/version'\n\n"
gemspec.puts 'Gem::Specification.new do |s|'
gemspec.puts "\ts.name          = \"#{p_name}\""
gemspec.puts "\ts.version       = #{p_name}::VERSION"
gemspec.puts "\ts.platform      = Gem::Platform::RUBY"
gemspec.puts "\ts.authors       = #{authors}"
gemspec.puts "\ts.email         = #{email}"
gemspec.puts "\ts.homepage      = #{site}"
gemspec.puts "\ts.summary       = #{summary}"
gemspec.puts "\ts.description   = #{description}"
gemspec.puts "\ts.license       = #{license}"
gemspec.puts "\ts.files         = ['lib/#{p_name}.rb']"
gemspec.puts "\ts.executables   = ['bin/#{p_name}']"
gemspec.puts "\ts.test_files    = ['test/test_#{p_name}.rb']"
gemspec.puts "\ts.require_path  = ['lib']"
gemspec.puts 'end'