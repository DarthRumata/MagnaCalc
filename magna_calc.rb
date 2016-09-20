require_relative 'operations.rb'

class MagnaCalc

  def self.calculate(input_array)
    begin
      operation = Operation.new(input_array[0], input_array[1], input_array[2])
      p operation.execute
    rescue ErrorContainerException => e
      UserInterface.show_errors(e.errors)
    end
  end


end



