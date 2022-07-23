require 'domain/board'

module Domain
  class Board
    describe self do
      subject :board do
        described_class.new(id:, title:)
      end

      let :id do
        1
      end

      let :title do
        'A board title'
      end

      let :other_title do
        'Another board title'
      end

      it '#change_title' do
        expect(board.change_title(other_title))
          .to be == TitleChanged.new(
            id:, from: title, to: other_title
          )
      end
    end
  end
end
