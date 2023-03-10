# @param {String} number
# @param {Character} digit
# @return {String}
def remove_digit(number, digit)
  occurrences = []
  number.each_char.with_index do |char,i|
    if char == digit
      occurrences << i
    end
  end
  deleted_index = 0
  maior = "-1"
  occurrences.each do |i|
    aux = number[0...i] + number[i+1..-1]
    if aux.to_i > maior.to_i
      maior = aux
      deleted_index = i
    end
  end
  maior
end
number = "551"
digit = "5"
puts remove_digit(number, digit)
