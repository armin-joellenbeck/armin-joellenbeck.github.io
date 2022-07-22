describe Proc do
  let :f do
    ->(x) { x * x }
  end

  let :g do
    ->(x) { x + 1 }
  end

  describe '#>>' do
    it do
      expect((f >> g).call(3)).to be == 10
    end
  end

  describe '#<<' do
    it do
      expect((f << g).call(3)).to be == 16
    end
  end
end
