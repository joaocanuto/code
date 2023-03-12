def vowel_strings(words, left, right)
  words = words[left..right]
  cont = 0
  words.each do |word|
    ini = word[0]
    fim = word[-1]
    vowel = ["a","e","i","o","u"]
    if vowel.include?(ini) && vowel.include?(fim)
      cont += 1
    end
  end
  cont
end
words = ["are","amy","u"]
left = 0
right = 2

puts vowel_strings(words,left,right)
