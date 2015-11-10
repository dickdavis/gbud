require './skeleton.rb'
File.open("#{p_name}/lib/#{p_name}.rb", 'w') do
  puts "require '#{p_name}/base'"
end

File.open("#{p_name}/lib/#{p_name}/version.rb", 'w') do
  puts "module #{p_name}"
  puts "\tVERSION = #{version}"
  puts 'end'
end
