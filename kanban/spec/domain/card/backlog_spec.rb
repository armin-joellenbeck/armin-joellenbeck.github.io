require 'domain/card/backlog'

module Domain
  class Card
    describe Backlog do
      subject :backlog do
        described_class.new(id)
      end

      let :id do
        2
      end

      it '#delete' do
        expect(backlog.delete).to be == StateChanged.new(
          id:,
          from: described_class,
          to: Trash
        )
      end

      it '#cancel' do
        expect do
          backlog.cancel
        end.to raise_error State::InvalidTransition
      end

      it '#select' do
        expect(backlog.select).to be == StateChanged.new(
          id:,
          from: described_class,
          to: Todo
        )
      end

      it '#start' do
        expect do
          backlog.start
        end.to raise_error State::InvalidTransition
      end

      it '#finish' do
        expect do
          backlog.finish
        end.to raise_error State::InvalidTransition
      end
    end
  end
end
