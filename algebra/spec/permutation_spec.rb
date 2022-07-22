require 'permutation'

describe Permutation do
  describe '#[]' do
    describe '(id)' do
      let :id do
        described_class.new
      end

      it do
        expect(id[1]).to be == 1
      end

      it do
        expect(id[2]).to be == 2
      end

      it do
        expect(id[3]).to be == 3
      end
    end

    describe '(cycle)' do
      let :cycle do
        described_class.new(1 => 2, 2 => 3, 3 => 1)
      end

      it do
        expect(cycle[1]).to be == 2
      end

      it do
        expect(cycle[2]).to be == 3
      end

      it do
        expect(cycle[3]).to be == 1
      end
    end
  end

  describe '#==' do
    it 'true for equal but not' do
      pi = described_class.new(1 => 2, 2 => 3, 3 => 1)
      rho = described_class.new(1 => 2, 2 => 3, 3 => 1)
      expect(pi).to be == rho
    end

    it 'false for really different' do
      pi = described_class.new(1 => 2, 2 => 3, 3 => 1)
      id = described_class.new
      expect(pi).not_to be == id
    end
  end

  describe '#*' do
    it 'works correctly' do
      id = described_class.new
      pi = described_class.new(1 => 2, 2 => 3, 3 => 1)
      rho = described_class.new(1 => 3, 2 => 1, 3 => 2)
      expect(pi * rho).to be == id
    end
  end
end
