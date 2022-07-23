require 'formal_sum'
require 'monomial'

class Polynomial < FormalSum
  def summand_class
    Monomial
  end

  def summand_identity
    Monomial.new(0)
  end
end
