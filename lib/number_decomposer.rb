require_relative './i18n'

class NumberDecomposer
  def initialize
    @i18n = ::I18n.new
  end

  TRANSLATIONS = {
    '1' => {
      one: 'тысяча',
      few: 'тысячи',
      many: 'тысяч'
    },
    '2' => {
      one: 'миллион',
      few: 'миллиона',
      many: 'миллионов'
    },
    '3' => {
      one: 'миллиард',
      few: 'миллиарда',
      many: 'миллиардов'
    },
    '4' => {
      one: 'триллион',
      few: 'триллиона',
      many: 'триллионов'
    },
  }

  def valid?(digit)
    digit[/^\d+$/] != nil
  end

  def decompose(number)
    result = []
    triples = to_triples(number)

    trillions = triples[4].join.to_i
    trillions_text = i18n.plural_form(trillions, **TRANSLATIONS['4'])
    result += [trillions, trillions_text] if trillions > 0

    milliards = triples[3].join.to_i
    milliards_text = i18n.plural_form(milliards, **TRANSLATIONS['3'])
    result += [milliards, milliards_text] if milliards > 0

    millions = triples[2].join.to_i
    millions_text = i18n.plural_form(millions, **TRANSLATIONS['2'])
    result += [millions, millions_text] if millions > 0

    thousands = triples[1].join.to_i
    thousands_text = i18n.plural_form(thousands, **TRANSLATIONS['1'])
    result += [thousands, thousands_text] if thousands > 0

    units, tens, hundreds = decompose_digit(triples.first.join).map(&:to_i)
    hundreds_text = i18n.plural_form(hundreds.to_i, one: 'сотня', few: 'сотни', many: 'сотен')
    result += [hundreds, hundreds_text] if hundreds > 0

    tens_text = i18n.plural_form(tens.to_i, one: 'десяток', few: 'десятка', many: 'десятков')
    result += [tens, tens_text] if tens > 0

    units_text = i18n.plural_form(units.to_i, one: 'единица', few: 'единицы', many: 'единиц')
    result += [units, units_text] if units > 0

    result.join(' ')
  end

  private

  attr_reader :i18n

  def to_triples(number)
    number.rjust(15, '0').reverse.split('').each_slice(3).to_a.map(&:reverse)
  end

  def decompose_digit(digit)
    digit.rjust(3, '0').reverse.split('')
  end
end
