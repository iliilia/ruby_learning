require_relative '../../lib/number_decomposer'

def subject
  described_class.new
end

describe ::NumberDecomposer, type: :module do
  describe '.valid?' do
    def call(number)
      subject.valid?(number)
    end

    it 'Returns true for "0"' do
      expect(call('0')).to eq true
    end

    it 'Return for string "abc"' do
      expect(call('abc')).to eq false
    end
  end

  describe '.decompose' do
    def call(number)
      subject.decompose(number)
    end

    shared_examples 'Returns expected text for desired number' do
      it do
        expect(call(number)).to eq expected_number_text
      end
    end

    describe 'Correctly inflects unit names' do
      it_behaves_like 'Returns expected text for desired number' do
        let(:number) { '1' }
        let(:expected_number_text) { '1 единица' }
      end

      it_behaves_like 'Returns expected text for desired number' do
        let(:number) { '2' }
        let(:expected_number_text) { '2 единицы' }
      end

      it_behaves_like 'Returns expected text for desired number' do
        let(:number) { '7' }
        let(:expected_number_text) { '7 единиц' }
      end
    end

    describe 'Correctly inflects tens names' do
      it_behaves_like 'Returns expected text for desired number' do
        let(:number) { '10' }
        let(:expected_number_text) { '1 десяток' }
      end

      it_behaves_like 'Returns expected text for desired number' do
        let(:number) { '20' }
        let(:expected_number_text) { '2 десятка' }
      end

      it_behaves_like 'Returns expected text for desired number' do
        let(:number) { '70' }
        let(:expected_number_text) { '7 десятков' }
      end
    end

    describe 'Correctly inflects hundreds names' do
      it_behaves_like 'Returns expected text for desired number' do
        let(:number) { '100' }
        let(:expected_number_text) { '1 сотня' }
      end

      it_behaves_like 'Returns expected text for desired number' do
        let(:number) { '200' }
        let(:expected_number_text) { '2 сотни' }
      end

      it_behaves_like 'Returns expected text for desired number' do
        let(:number) { '700' }
        let(:expected_number_text) { '7 сотен' }
      end
    end

    describe 'Correctly inflects thousands names' do
      it_behaves_like 'Returns expected text for desired number' do
        let(:number) { '1000' }
        let(:expected_number_text) { '1 тысяча' }
      end

      it_behaves_like 'Returns expected text for desired number' do
        let(:number) { '2000' }
        let(:expected_number_text) { '2 тысячи' }
      end

      it_behaves_like 'Returns expected text for desired number' do
        let(:number) { '7000' }
        let(:expected_number_text) { '7 тысяч' }
      end
    end

    describe 'Correctly inflects millions names' do
      it_behaves_like 'Returns expected text for desired number' do
        let(:number) { '1000000' }
        let(:expected_number_text) { '1 миллион' }
      end

      it_behaves_like 'Returns expected text for desired number' do
        let(:number) { '2000000' }
        let(:expected_number_text) { '2 миллиона' }
      end

      it_behaves_like 'Returns expected text for desired number' do
        let(:number) { '7000000' }
        let(:expected_number_text) { '7 миллионов' }
      end
    end

    describe 'Correctly inflects milliards names' do
      it_behaves_like 'Returns expected text for desired number' do
        let(:number) { '1000000000' }
        let(:expected_number_text) { '1 миллиард' }
      end

      it_behaves_like 'Returns expected text for desired number' do
        let(:number) { '2000000000' }
        let(:expected_number_text) { '2 миллиарда' }
      end

      it_behaves_like 'Returns expected text for desired number' do
        let(:number) { '7000000000' }
        let(:expected_number_text) { '7 миллиардов' }
      end
    end

    describe 'Correctly inflects trillions names' do
      it_behaves_like 'Returns expected text for desired number' do
        let(:number) { '1000000000000' }
        let(:expected_number_text) { '1 триллион' }
      end

      it_behaves_like 'Returns expected text for desired number' do
        let(:number) { '2000000000000' }
        let(:expected_number_text) { '2 триллиона' }
      end

      it_behaves_like 'Returns expected text for desired number' do
        let(:number) { '7000000000000' }
        let(:expected_number_text) { '7 триллионов' }
      end
    end
  end
end
