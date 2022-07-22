class FormalSum
  def initialize(param = {})
    @coefficients = case param
                    when summand_class
                      { param => 1 }
                    when Numeric
                      { summand_identity => param }
                    else
                      param.reject { |_, value| value.zero? }
                    end
  end

  def coerce(other)
    [self.class.new(other), self]
  end

  def hash
    @coefficients.hash
  end

  def eql?(other)
    self.class == other.class &&
      @coefficients.eql?(other.coefficients)
  end

  def ==(other)
    other = self.class.new(other) unless other.is_a?(self.class)
    eql?(other)
  end

  def +(other)
    other = self.class.new(other) unless other.is_a?(self.class)
    self.class.new(
      @coefficients.merge(other.coefficients) do |_, value, other_value|
        value + other_value
      end
    )
  end

  def *(other)
    other = self.class.new(other) unless other.is_a?(self.class)
    @coefficients.inject(0) do |sum, (key, value)|
      sum + other.coefficients.inject(0) do |other_sum, (other_key, other_value)|
        other_sum + self.class.new(key * other_key => value * other_value)
      end
    end
  end

  def **(other)
    result = self.class.new(1)
    square = self

    other.to_s(2).chars.reverse.each do |char|
      result *= square if char.eql?('1')
      square *= square
    end

    result
  end

  protected

  attr_reader :coefficients
end
