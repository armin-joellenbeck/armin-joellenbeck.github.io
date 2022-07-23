require 'base/created'

module Domain
  class Card
    class Created < Base::Created
      def initialize(id:, title:, text:, state:, board_id:)
        super(id:)
        @title = title
        @text = text
        @state = state
        @board_id = board_id
      end
    end
  end
end
