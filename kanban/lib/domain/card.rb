require 'domain/card/text_changed'
require 'domain/card/title_changed'
require 'domain/card/created'

module Domain
  class Card
    def self.create(id:, title:, text:, state:, board_id:)
      Created.new(id:, title:, text:, state:, board_id:)
    end

    def initialize(id:, title:, text:, state:, board_id:)
      @id = id
      @title = title
      @text = text
      @state = state
      @board_id = board_id
    end

    def change_title(title)
      TitleChanged.new(id: @id, from: @title, to: title)
    end

    def change_text(text)
      TextChanged.new(id: @id, from: @text, to: text)
    end

    def deleted?
      @state.is_a?(Trash)
    end

    def delete
      @state.delete
    end

    def select
      @state.select
    end

    def start
      @state.start
    end

    def finish
      @state.finish
    end
  end
end
