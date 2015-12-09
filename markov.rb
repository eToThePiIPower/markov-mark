class MarkovChain
  def initialize
    @words = {}
  end

  def learn(text)
    text = text.downcase.chomp
    wordlist = text.split.map(&:split).flatten
    wordlist.each_with_index do |word, i|
      @words[word] ||= {}
      @words[word][wordlist[i+1]] ||= 0
      @words[word][wordlist[i+1]] += 1
    end
  end

  def talk
    sentence = []
    next_word = @words.keys.shuffle.first
    while(true)
      sentence << next_word
      next_word = pick_next(next_word)
      break if next_word.nil?
    end
    sentence.join(' ')
  end

  def pick_next(word)
    deck = []
    return nil if @words[word].nil?
    @words[word].each do |key, value|
      value.times { deck << key }
    end
    deck.shuffle.first
  end

  attr_reader :words
end
