require_relative './i18n'

class NumberDecomposition
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
    digit[/^\d+$/]
  end

  def decompose(number)
    triples = to_triples(number)

    trillions = triples[4].join.to_i
    trillions_text = i18n.plural_form(trillions, **TRANSLATIONS['4'])
    milliards = triples[3].join.to_i
    milliards_text = i18n.plural_form(milliards, **TRANSLATIONS['3'])
    millions = triples[2].join.to_i
    millions_text = i18n.plural_form(millions, **TRANSLATIONS['2'])
    thousands = triples[1].join.to_i
    thousands_text = i18n.plural_form(thousands, **TRANSLATIONS['1'])

    units, tens, hundreds = decompose_digit(triples.first.join)
    hundreds_text = i18n.plural_form(hundreds.to_i, one: 'сотня', few: 'сотни', many: 'сотен')
    tens_text = i18n.plural_form(tens.to_i, one: 'десяток', few: 'десятка', many: 'десятков')
    units_text = i18n.plural_form(units.to_i, one: 'единица', few: 'единицы', many: 'единиц')

    [trillions, trillions_text, milliards, milliards_text, millions, millions_text, thousands, thousands_text, hundreds, hundreds_text, tens, tens_text, units, units_text]
  end

  private

  attr_reader :i18n

  def to_triples(number)
    number.reverse.split('').each_slice(3).to_a.map(&:reverse)
  end

  def decompose_digit(digit)
    digit.rjust(3, '0').reverse.split('')
  end
end
