require 'base/event'

module Base
  class Changed < Event
    def initialize(id:, from:, to:)
      super(id:)
      @from = from
      @to = to
    end
  end
end
