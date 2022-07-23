require 'domain/card/todo'

module Domain
  class Card
    describe Todo do
      subject :todo do
        described_class.new(id)
      end

      let :id do
        2
      end

      it '#delete' do
        expect do
          todo.delete
        end.to raise_error State::InvalidTransition
      end

      it 'cancel' do
        expect(todo.cancel).to be == StateChanged.new(
          id:,
          from: described_class,
          to: Backlog
        )
      end

      it '#select' do
        expect do
          todo.select
        end.to raise_error State::InvalidTransition
      end

      it '#start' do
        expect(todo.start).to be == StateChanged.new(
          id:,
          from: described_class,
          to: Ongoing
        )
      end

      it '#finish' do
        expect do
          todo.finish
        end.to raise_error State::InvalidTransition
      end
    end
  end
end
