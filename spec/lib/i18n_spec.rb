require_relative '../../lib/i18n'

def call(count)
  described_class.new.plural_form(count, one: 'штука', few: 'штуки', many: 'штук')
end

describe ::I18n, type: :module do
  describe '.plural_form' do
    it 'Для числа 0 вернёт "штук"' do
      expect(call(0)).to eq 'штук'
    end

    it 'Для числа 1 вернёт "штука"' do
      expect(call(1)).to eq 'штука'
    end

    it 'Для числа 2 вернёт "штуки"' do
      expect(call(2)).to eq 'штуки'
    end

    it 'Для числа 3 вернёт "штуки"' do
      expect(call(3)).to eq 'штуки'
    end

    it 'Для числа 4 вернёт "штуки"' do
      expect(call(4)).to eq 'штуки'
    end

    it 'Для числа 5 вернёт "штук"' do
      expect(call(5)).to eq 'штук'
    end

    it 'Для числа 6 вернёт "штук"' do
      expect(call(6)).to eq 'штук'
    end

    it 'Для числа 7 вернёт "штук"' do
      expect(call(7)).to eq 'штук'
    end

    it 'Для числа 8 вернёт "штук"' do
      expect(call(8)).to eq 'штук'
    end

    it 'Для числа 9 вернёт "штук"' do
      expect(call(9)).to eq 'штук'
    end

    it 'Для числа 10 вернёт "штук"' do
      expect(call(10)).to eq 'штук'
    end

    it 'Для числа 11 вернёт "штук"' do
      expect(call(11)).to eq 'штук'
    end

    it 'Для числа 12 вернёт "штук"' do
      expect(call(12)).to eq 'штук'
    end

    it 'Для числа 13 вернёт "штук"' do
      expect(call(13)).to eq 'штук'
    end

    it 'Для числа 14 вернёт "штук"' do
      expect(call(14)).to eq 'штук'
    end

    it 'Для числа 15 вернёт "штук"' do
      expect(call(15)).to eq 'штук'
    end

    it 'Для числа 16 вернёт "штук"' do
      expect(call(16)).to eq 'штук'
    end

    it 'Для числа 17 вернёт "штук"' do
      expect(call(17)).to eq 'штук'
    end

    it 'Для числа 18 вернёт "штук"' do
      expect(call(18)).to eq 'штук'
    end

    it 'Для числа 19 вернёт "штук"' do
      expect(call(19)).to eq 'штук'
    end

    it 'Для числа 20 вернёт "штук"' do
      expect(call(20)).to eq 'штук'
    end

    it 'Для числа 21 вернёт "штука"' do
      expect(call(21)).to eq 'штука'
    end

    it 'Для числа 22 вернёт "штуки"' do
      expect(call(22)).to eq 'штуки'
    end

    it 'Для числа 23 вернёт "штуки"' do
      expect(call(23)).to eq 'штуки'
    end

    it 'Для числа 24 вернёт "штуки"' do
      expect(call(24)).to eq 'штуки'
    end

    it 'Для числа 25 вернёт "штук"' do
      expect(call(25)).to eq 'штук'
    end

    it 'Для числа 26 вернёт "штук"' do
      expect(call(26)).to eq 'штук'
    end

    it 'Для числа 27 вернёт "штук"' do
      expect(call(27)).to eq 'штук'
    end

    it 'Для числа 28 вернёт "штук"' do
      expect(call(28)).to eq 'штук'
    end

    it 'Для числа 29 вернёт "штук"' do
      expect(call(29)).to eq 'штук'
    end

    it 'Для числа 30 вернёт "штук"' do
      expect(call(30)).to eq 'шт1ук'
    end

  end
end
