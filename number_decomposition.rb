require_relative './lib/number_decomposition'

puts 'number decomposition'
print 'enter the number: '
number = gets.chomp

decomposer = NumberDecomposition.new

raise ArgumentError, "Error! number. The text you entered '#{number}' is not a number" unless decomposer.valid?(number)

puts "You entered a number #{number}"

items = decomposer.decompose(number)
puts "A number #{number} has a #{items.join(' ')}."

# TODO: what if the number is bulet 323434545678
#       the program must write: 323 миллиарда 434 миллиона 545 тысяч 6 сотен 7 десятков 8 единиц
