require 'domain/card/state'

module Domain
  class Card
    class Ongoing < State
      def cancel
        StateChanged.new(
          id: @id, from: self.class, to: Backlog
        )
      end

      def finish
        StateChanged.new(
          id: @id, from: self.class, to: Done
        )
      end
    end
  end
end
