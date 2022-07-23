require 'domain/card'
require 'domain/card/state'

module Domain
  class Card
    describe self do
      subject :card do
        described_class.new(id:, title:, text:, state:, board_id:)
      end

      let :title do
        'A title'
      end

      let :id do
        2
      end

      let :text do
        'A text'
      end

      let :state do
        instance_spy(State)
      end

      let :board_id do
        1
      end

      it '.create' do
        expect(
          described_class.create(id:, title:, text:, state:, board_id:)
        ).to be == Created.new(id:, title:, text:, state:, board_id:)
      end

      it '#change_title' do
        other_title = 'Another card title'
        expect(card.change_title(other_title))
          .to be == TitleChanged.new(
            id:, from: title, to: other_title
          )
      end

      it '#change_text' do
        other_text = 'Another card text'
        expect(card.change_text(other_text))
          .to be == TextChanged.new(
            id:, from: text, to: other_text
          )
      end

      it '#delete' do
        card.delete
        expect(state).to have_received(:delete)
      end

      it '#select' do
        card.select
        expect(state).to have_received(:select)
      end

      it '#start' do
        card.start
        expect(state).to have_received(:start)
      end

      it '#finish' do
        card.finish
        expect(state).to have_received(:finish)
      end
    end
  end
end
