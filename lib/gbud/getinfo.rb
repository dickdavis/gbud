# extracts required information for project
class GetInfo
  def initialize(prompt)
    @prompt = prompt
    @info = ''
    @u_verify = ''
  end

  def user_prompt
    loop do
      print @prompt
      take_input
      break if verify_input
    end
    @info
  end

  def take_input
    @info = gets.chomp.to_s
  end

  def verify_input
    puts "You have entered: #{@info}"
    print 'Is this correct? (Y/N) => '
    @u_verify = gets.chomp.to_s.upcase
    return false unless @u_verify == 'Y'
    true
  end
end
