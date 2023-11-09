puts 'введите два числа через запятую'
user_input = gets.chomp
puts "user_input: #{user_input}"
digit_strings = user_input.split(',')
puts "digit_strings: #{digit_strings}"
# Код с использованием итератора map:
digits = digit_strings.map(&:to_f)

# Код с использованием цикла for:
# digits = []
# for index in (0...digit_strings.size) do
#   digits.push(digit_strings[index].to_f)
# end

puts "digits: #{digits}"
sum = digits.sum
puts "Сумма: #{sum}"
min = digits.min
puts "Минимальное значение: #{min}"
max = digits.max
puts "Максмальное значение: #{max}"
digits.each do |digit|
  if digit < 10
    puts("#{digit} Меньше десяти")
  elsif digit > 10
    puts("#{digit} больше десяти")
  else
    puts("#{digit} Равно десяти")
  end
end

positive_digits = digits.filter(&:positive?)
puts "positive_digits: #{positive_digits}"
negative_digits = digits.filter(&:negative?)
puts "negative_digits: #{negative_digits}"
zero_digits = digits.filter(&:zero?)
puts "zero_digits: #{zero_digits}"
