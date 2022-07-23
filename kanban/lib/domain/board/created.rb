require 'base/created'

module Domain
  class Board
    class Created < Base::Created
      def initialize(id:, title:)
        super(id:)
        @title = title
      end
    end
  end
end
