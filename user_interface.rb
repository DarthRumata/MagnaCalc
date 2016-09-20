require_relative 'magna_calc.rb'

class UserInterface

  def self.clean_input
    @user_input = []
  end

  def self.ask_for_input
    clean_input

    p 'First argument:'
    @user_input << gets.chomp

    p 'Second argument:'
    @user_input << gets.chomp

    p 'Operation code:'
    @user_input << gets.chomp
  end

  def self.process_input

  end

  def self.show_errors(errors)
    puts 'Errors:'
    errors.each { |error| p error }
  end

end

loop do
  input = UserInterface.ask_for_input
  MagnaCalc.calculate(input)
end