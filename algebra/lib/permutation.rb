class Permutation
  def initialize(values = {})
    @values = values.reject { |index, value| index.equal?(value) }
  end

  def [](index)
    @values[index] || index
  end

  def ==(other)
    eql?(other)
  end

  def eql?(other)
    values.eql?(other.values)
  end

  def *(other)
    Permutation.new(
      values.transform_values { |value| other[value] }
    )
  end

  protected

  attr_reader :values
end
