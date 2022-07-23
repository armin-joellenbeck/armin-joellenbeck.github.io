require 'domain/board/created'
require 'domain/board/title_changed'

module Domain
  class Board
    def initialize(id:, title:)
      @id = id
      @title = title
    end

    attr_reader :id

    def change_title(title)
      TitleChanged.new(id: @id, from: @title, to: title)
    end

    def delete; end
  end
end
