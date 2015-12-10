def sentence_case(string)
  string = string.split('. ').map do |sentence|
    capitalize_first(sentence)
  end.join('. ')
  string = string.split('? ').map do |sentence|
    capitalize_first(sentence)
  end.join('? ')
  string = string.split('! ').map do |sentence|
    capitalize_first(sentence)
  end.join('! ')
  string
end

private

def capitalize_first(string)
  string[0] = string[0].upcase
  string
end
