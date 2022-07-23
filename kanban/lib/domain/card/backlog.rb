require 'domain/card/state'
require 'domain/card/state_changed'

module Domain
  class Card
    class Backlog < State
      def delete
        StateChanged.new(
          id: @id, from: self.class, to: Trash
        )
      end

      def select
        StateChanged.new(
          id: @id, from: self.class, to: Todo
        )
      end
    end
  end
end
