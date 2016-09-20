require_relative 'exceptions.rb'
require_relative 'converter.rb'

class Operation

  def initialize(arg1, arg2, operation_code)
    @errors = []
    @oper_strategies = {
        :'+' => method(:simple_sum),
        :'concat' => method(:simple_sum),
        :'+.' => method(:simple_sum)
    }

    check_arguments(arg1, arg2)
    check_operation_code(operation_code)

    check_for_errors

    begin
      @arg1 = Converter.convert!(arg1, operation_code)
      @arg2 = Converter.convert!(arg2, operation_code)
    rescue
      @errors << 'Cannot convert arguments to expected classes'
    end
    check_for_errors

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
  end

  def check_for_errors
    if @errors.count > 0
      exception = ErrorContainerException.new(@errors)
      raise exception
    end
  end

  def select_strategy_for_code(operation_code)
    @current_method = @oper_strategies[operation_code.to_sym]

    if @current_method == nil
      @errors << 'There is no operation for entered arguments'
    end
  end

  #Operations

  def simple_sum()
    @arg1 + @arg2
  end

end
