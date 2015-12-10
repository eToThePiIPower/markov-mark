# A very, very simple Markov chain
class MarkovEngine
  def initialize
    @words = {}
  end

  def learn(text)
    wordlist = text.split
    wordlist.each_with_index do |word, i|
      @words[word] ||= Hash.new(0)
      @words[word][wordlist[i + 1]] += 1
    end
  end

  def talk(next_word = nil)
    sentence = []
    next_word ||= @words.keys.sample
    loop do
      sentence << next_word
      next_word = pick_next(next_word)
      break if next_word.nil?
    end
    sentence.join(' ')
  end

  private

  def pick_next(word)
    return nil if @words[word].nil?
    deck = []
    @words[word].each do |key, value|
      value.times { deck << key }
    end
    deck.sample
  end
end
