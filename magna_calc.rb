require_relative 'operations.rb'

class MagnaCalc

  public

  def calculate (arg1, arg2, operation_code)
    begin
      operation = Operation.new(arg1, arg2, operation_code)
      operation.execute
    rescue ErrorContainerException => e
      show_errors(e.errors)
    end

  end

  def show_errors(errors)
    p 'Errors:'
    errors.each { |error| p error }
  end

end