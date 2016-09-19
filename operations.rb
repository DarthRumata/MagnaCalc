require_relative 'exceptions.rb'

class Operation

  def initialize(arg1, arg2, operation_code)
    @number_plus_key = make_key(Numeric, '+')
    @fixnum_plus_key = make_key(Fixnum, '+')
    @errors = []
    @oper_strategies = {
        @number_plus_key => method(:sum_numbers),
        @fixnum_plus_key => method(:sum_numbers)
    }

    check_arguments(arg1, arg2)
    check_operation_code(operation_code)

    check_for_errors

    @arg1 = arg1
    @arg2 = arg2

    select_strategy_for_code(operation_code)
    check_for_errors
  end

  def execute
    @current_method.()
  end

  private

  def check_arguments (arg1, arg2)
    if arg1 == nil
      @errors << 'First argument is empty!'
    end
    if arg2 == nil
      @errors << 'Second argument is empty!'
    end
    if arg1.class != arg2.class
      @errors << 'Arguments doesn\'t belong to the same class'
    end
  end

  def check_operation_code(operation_code)
    if operation_code == nil
      @errors << 'Operation code is empty!'
    end
    unless operation_code.instance_of? String
      @errors << "Operation code #{operation_code.class} isn't String class!"
    end
  end

  def check_for_errors
    if @errors.count > 0
      exception = ErrorContainerException.new(@errors)
      raise exception
    end
  end

  def select_strategy_for_code(operation_code)
    current_oper_key = make_key(@arg1.class, operation_code)
    @current_method = @oper_strategies[current_oper_key]

    if @current_method == nil
      @errors << 'There is no operation for entered arguments'
    end
  end

  def make_key(argument, operation_code)
    argument.class.to_s + operation_code
  end

  #Operations

  def sum_numbers()
    @arg1 + @arg2
  end

end
