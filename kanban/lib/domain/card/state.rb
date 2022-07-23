require 'base/value'

module Domain
  class Card
    class State
      class InvalidTransition < StandardError
      end

      include Base::Value

      def initialize(id)
        @id = id
      end

      def delete
        raise InvalidTransition
      end

      def cancel
        raise InvalidTransition
      end

      def select
        raise InvalidTransition
      end

      def start
        raise InvalidTransition
      end

      def finish
        raise InvalidTransition
      end
    end
  end
end
