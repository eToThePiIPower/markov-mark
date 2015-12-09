require 'spec_helper'
require 'markov_chain'

describe MarkovChain do
  describe '#learn' do
    it 'generates a Markov dictionary from a learned sentence' do
      mark = MarkovChain.new
      mark.learn 'test one test two'

      words = mark.words

      expect(words).to eq(
        'test' => {
          'one' => 1,
          'two' => 1
        },
        'one' => {
          'test' => 1
        },
        'two' => {
          nil => 1
        }
      )
    end

    it 'adds to the Markov dictionary from a second learned sentence' do
      mark = MarkovChain.new
      mark.learn 'test one test two'
      mark.learn 'one test four test'

      words = mark.words

      expect(words).to eq(
        'test' => {
          'one' => 1,
          'two' => 1,
          'four' => 1,
          nil => 1
        },
        'one' => {
          'test' => 2
        },
        'two' => {
          nil => 1
        },
        'four' => {
          'test' => 1
        }
      )
    end
  end

  describe '#talk' do
    it 'generates some text' do
      mark = MarkovChain.new
      mark.learn 'text'

      sample = mark.talk

      expect(sample).to eq 'text'
    end

    it 'accepts an optional seed word' do
      mark = MarkovChain.new
      mark.learn 'one two three four five six seven eight'

      sample = mark.talk('two')

      expect(sample.split.first).to eq 'two'
      expect(sample).to eq 'two three four five six seven eight'
    end
  end
end
