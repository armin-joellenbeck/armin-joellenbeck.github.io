module Lambda
  def self.y_combinator(recurse)
    ->(x) { recurse.call(->(y) { x.call(x).call(y) }) }.call(
      ->(x) { recurse.call(->(y) { x.call(x).call(y) }) }
    )
  end
end
