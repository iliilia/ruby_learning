require_relative './i18n'
include I18n

def decompose_digit(digit)
  digit.rjust(3, '0').reverse.split('')
end

def valid?(digit)
  digit[/^\d+$/]
end

puts 'Декомпозиция двузначного числа'
print 'Введите двузначное число: '
digit = gets.chomp

raise ArgumentError, "Ошибка! Введите число. Введёный вами текст '#{digit}' не является числом!" unless valid?(digit)

puts "Вы ввели число #{digit}"
units, tens, hundreds = decompose_digit(digit)

hundreds_text = plural_form(hundreds.to_i, one: 'сотня', few: 'сотни', many: 'сотен')
tens_text = plural_form(tens.to_i, one: 'десяток', few: 'десятка', many: 'десятков')
units_text = plural_form(units.to_i, one: 'единица', few: 'единицы', many: 'единиц')

puts "в числе #{digit} #{hundreds} #{hundreds_text} #{tens} #{tens_text}, #{units} #{units_text}."

# TODO: Что, если число будет 323434545678
#       Программа должна написать: 323 миллиарда 434 миллиона 545 тысяч 6 сотен 7 десятков 8 единиц
