def is_isogram(word)

  word_new = word.downcase
  index = 0
  while index < word_new.length()
    second_index = index + 1
    while second_index < word_new.length()
      if word_new[index] == word_new[second_index]
        return false;
      end
      second_index += 1
    end
    index += 1
  end
  return true;
end

puts is_isogram("Dermatoglyphics")
puts is_isogram("aba")
puts is_isogram("MoOse")
puts is_isogram("")
