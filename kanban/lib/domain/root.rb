require 'domain/board/deleted'

module Domain
  class Root
    class BoardNotFound < StandardError
    end

    class BoardAlreadyExists < StandardError
    end

    def create_board(id:, title:)
      raise BoardAlreadyExists if @boards.any?(&by(id))

      @boards << (Board.new(id:, title:))
      Board::Created.new(id:, title:)
    end

    def delete_board(id:)
      @boards.find(&by(id)).tap do |result|
        raise BoardNotFound if result.nil?
      end.delete
    end

    private

    def initialize(boards: [])
      @boards = boards
    end

    def by(id)
      ->(board) { board.id == id }
    end
  end
end
