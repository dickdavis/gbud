require './skeleton.rb'
File.open("#{p_name}/lib/#{p_name}.rb", 'w') do
  puts "require '#{p_name}/base'"
end

