require 'domain/card/trash'

module Domain
  class Card
    describe Trash do
      subject :trash do
        described_class.new(id)
      end

      let :id do
        2
      end

      it '#delete' do
        expect do
          trash.delete
        end.to raise_error State::InvalidTransition
      end

      it 'cancel' do
        expect do
          trash.cancel
        end.to raise_error State::InvalidTransition
      end

      it '#select' do
        expect do
          trash.select
        end.to raise_error State::InvalidTransition
      end

      it '#start' do
        expect do
          trash.start
        end.to raise_error State::InvalidTransition
      end

      it '#finish' do
        expect do
          trash.finish
        end.to raise_error State::InvalidTransition
      end
    end
  end
end
