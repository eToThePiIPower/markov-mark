require 'tools'

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
    sentence_case(sentence.join(' '))
  end

  def proper_nouns
    variations_list = all_words.group_by { |w| w.downcase unless w.nil? }
    variations_list.each_with_object([]) do |vs, acc|
      acc << vs[1][0] if vs[1].size == 1
      acc
    end
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

  def all_words
    all_words = (@words.keys + @words.values.map(&:keys).flatten).uniq
    all_words.reject!(&:nil?)
    all_words.map { |w| w.gsub(/[.?!]$/, '') }.uniq
  end

  def fix_list
    variation_list = all_words.group_by { |word| word.downcase unless word.nil? }
    fix_list = variation_list.select { |_, variations| variations.size > 1 }
    fix_list.each do |word, variations|
      variations.reject! { |w| w == word }
    end
  end

  def merge(word, variation)
    @words[variation].each do |key, value|
      @words[word][key] += value
    end
  end
end
