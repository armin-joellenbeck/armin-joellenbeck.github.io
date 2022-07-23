require 'domain/card/ongoing'

module Domain
  class Card
    describe Ongoing do
      subject :ongoing do
        described_class.new(id)
      end

      let :id do
        2
      end

      it '#delete' do
        expect do
          ongoing.delete
        end.to raise_error State::InvalidTransition
      end

      it '#cancel' do
        expect(ongoing.cancel).to be == StateChanged.new(
          id:,
          from: described_class,
          to: Backlog
        )
      end

      it '#select' do
        expect do
          ongoing.select
        end.to raise_error State::InvalidTransition
      end

      it '#start' do
        expect do
          ongoing.start
        end.to raise_error State::InvalidTransition
      end

      it '#finish' do
        expect(ongoing.finish).to be == StateChanged.new(
          id:,
          from: described_class,
          to: Done
        )
      end
    end
  end
end
