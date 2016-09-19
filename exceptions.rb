
class ErrorContainerException < Exception

  attr_reader :errors

  def initialize(errors=[])
    @errors = errors
  end

end