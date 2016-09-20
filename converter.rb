class Converter

  def self.convert!(value, type)
    case type
      when '+'
        Integer(value)
      when 'concat'
        String(value)
      when '+.'
        Float(value)
      else
        raise 'Invalid type'
    end
  end

end