require 'domain/root'

module Domain
  describe Root do
    let :id do
      1
    end

    let :title do
      'A board title'
    end

    let :another_title do
      'A board title'
    end

    describe '#create_board' do
      it 'creates the board' do
        root = described_class.new
        expect(root.create_board(id:, title:))
          .to be == Board::Created.new(id:, title:)
      end

      it 'the same board already exists' do
        root = described_class.new(boards: [Board.new(id:, title:)])
        expect { root.create_board(id:, title: another_title) }
          .to raise_error(described_class::BoardAlreadyExists)
      end
    end

    describe '#delete_board' do
      it 'delegates to found board' do
        board = instance_double(Board)
        board_deleted = instance_double(Board::Deleted)
        allow(board).to receive(:id).and_return(id)
        allow(board).to receive(:delete).and_return(board_deleted)
        root = described_class.new(boards: [board])
        expect(root.delete_board(id:))
          .to be == board_deleted
      end

      it 'board not found' do
        root = described_class.new
        expect { root.delete_board(id:) }
          .to raise_error(described_class::BoardNotFound)
      end
    end
  end
end
