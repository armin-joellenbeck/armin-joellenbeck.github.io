require 'domain/card/state'

module Domain
  class Card
    class Todo < State
      def cancel
        StateChanged.new(
          id: @id, from: self.class, to: Backlog
        )
      end

      def start
        StateChanged.new(
          id: @id, from: self.class, to: Ongoing
        )
      end
    end
  end
end
