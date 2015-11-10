# loop that extracts required information for project
module GetInfo
  def self.user_prompt(prompt)
    loop do
      print prompt
      @info = gets.chomp.to_s
      puts "You have entered: #{@info}"
      print 'Is this correct? (Y/N) => '
      u_verify = gets.chomp.to_s.upcase
      break if u_verify == 'Y'
    end
    @info
  end
end