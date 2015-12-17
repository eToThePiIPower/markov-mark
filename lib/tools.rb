def sentence_case(string, propers: [])
  string.downcase!
  string = string.split('. ').map do |sentence|
    capitalize(sentence)
  end.join('. ')
  string = string.split('? ').map do |sentence|
    capitalize(sentence)
  end.join('? ')
  string = string.split('! ').map do |sentence|
    capitalize(sentence)
  end.join('! ')
  string = string.split(' ').map do |word|
    capitalize_word(word, propers: propers)
  end.join(' ')
  string
end

private

def capitalize(string)
  string[0] = string[0].upcase
  string
end

def capitalize_word(word, propers: [])
  if word[-1] == '.' || word[-1] == '?' || word[-1] == '!'
    punc = word[-1]
    word = word[0..-2]
  else
    punc = ''
  end
  propers << 'I'
  propers.each do |w|
    return w + punc if w.downcase == word
  end
  word + punc
end
