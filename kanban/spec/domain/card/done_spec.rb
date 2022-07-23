require 'domain/card/done'

module Domain
  class Card
    describe Done do
      subject :done do
        described_class.new(id)
      end

      let :id do
        2
      end

      it '#delete' do
        expect do
          done.delete
        end.to raise_error State::InvalidTransition
      end

      it 'cancel' do
        expect do
          done.cancel
        end.to raise_error State::InvalidTransition
      end

      it '#select' do
        expect do
          done.select
        end.to raise_error State::InvalidTransition
      end

      it '#start' do
        expect do
          done.start
        end.to raise_error State::InvalidTransition
      end

      it '#finish' do
        expect do
          done.finish
        end.to raise_error State::InvalidTransition
      end
    end
  end
end
