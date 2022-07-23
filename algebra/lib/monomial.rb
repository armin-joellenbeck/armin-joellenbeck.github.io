class Monomial
  def initialize(degree)
    @degree = degree
  end

  def hash
    @degree.hash
  end

  def eql?(other)
    self.class == other.class && @degree.eql?(other.degree)
  end

  def ==(other)
    eql?(other)
  end

  def *(other)
    Monomial.new(degree + other.degree)
  end

  protected

  attr_reader :degree
end
