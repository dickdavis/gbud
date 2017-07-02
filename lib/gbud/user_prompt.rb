module GBud
  ##
  # = UserPrompt
  # Author::    Richard Davis
  # Copyright:: Copyright 2017 Richard Davis
  # License::   GNU Public License 3
  #
  # Module containing methods used to prompt the user for program
  # input.
  module UserPrompt
    @value = ''

    ##
    # Returns the value entered by the user
    def self.get_value(prompt)
      prompt_user prompt
      @value
    end

    ##
    # Prompts the user for a value
    def self.prompt_user(prompt)
      loop do
        print prompt
        @value = gets.chomp.to_s
        break if confirm_input
      end
    end

    ##
    # Confirms the value entered by the user
    def self.confirm_input
      puts "You have entered: #{@value}"
      print 'Is this correct? (Y/N) => '
      confirm = gets.chomp.to_s.upcase
      return false unless confirm == 'Y'
      true
    end
  end
end
