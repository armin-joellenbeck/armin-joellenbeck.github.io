require 'lambda'

describe Lambda do
  describe '.y_combinator' do
    describe '(fac)' do
      let :fac do
        described_class.y_combinator(
          ->(f) { ->(x) { x.zero? ? 1 : x * f.call(x - 1) } }
        )
      end

      it do
        expect(fac.call(0)).to be == 1
      end

      it do
        expect(fac.call(1)).to be == 1
      end

      it do
        expect(fac.call(2)).to be == 2
      end

      it do
        expect(fac.call(3)).to be == 6
      end

      it do
        expect(fac.call(4)).to be == 24
      end

      it do
        expect(fac.call(5)).to be == 120
      end
    end

    describe '(fibonacci)' do
      let :fibonacci do
        described_class.y_combinator(
          lambda { |f|
            lambda { |x|
              if x == 0
                0
              else
                (x == 1 ? 1 : f.call(x - 1) + f.call(x - 2))
              end
            }
          }
        )
      end

      it do
        expect(fibonacci.call(0)).to be == 0
      end

      it do
        expect(fibonacci.call(1)).to be == 1
      end

      it do
        expect(fibonacci.call(2)).to be == 1
      end

      it do
        expect(fibonacci.call(3)).to be == 2
      end

      it do
        expect(fibonacci.call(4)).to be == 3
      end

      it do
        expect(fibonacci.call(5)).to be == 5
      end

      it do
        expect(fibonacci.call(6)).to be == 8
      end

      it do
        expect(fibonacci.call(7)).to be == 13
      end
    end
  end
end
