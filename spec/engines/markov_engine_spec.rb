require 'spec_helper'
require 'engines/markov_engine'

describe MarkovEngine do
  describe '#learn' do
    it 'generates a Markov dictionary from a learned sentence' do
      mark = MarkovEngine.new
      mark.learn 'test one test two'

      words = mark.instance_variable_get('@words')

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
      mark = MarkovEngine.new
      mark.learn 'test one test two'
      mark.learn 'one test four test'

      words = mark.instance_variable_get('@words')

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

    it 'chomps non-printing characters' do
      mark = MarkovEngine.new
      mark.learn "test\t one test two"

      words = mark.instance_variable_get('@words')

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

    it 'returns a list of proper nouns' do
      mark = MarkovEngine.new
      mark.learn 'One Two'
      mark.learn 'Two one'
      mark.learn 'Three. One'

      proper_nouns = mark.proper_nouns

      expect(proper_nouns).to eq(['Two', 'Three'])
    end
  end

  describe '#talk' do
    it 'generates some text' do
      mark = MarkovEngine.new
      mark.learn 'text'

      sample = mark.talk

      expect(sample).to eq 'Text'
    end

    it 'accepts an optional seed word' do
      mark = MarkovEngine.new
      mark.learn 'one two three four five six seven eight'

      sample = mark.talk('two')

      expect(sample.split.first).to eq 'Two'
      expect(sample).to eq 'Two three four five six seven eight'
    end

    it 'is random' do
      mark = MarkovEngine.new
      mark.learn "one two three o'clock four o'clock rock"
      mark.learn 'one is the lonliest number that there ever is'
      mark.learn 'two can be as bad as one its the lonliest number since the number one'

      sample1 = mark.talk
      sample2 = mark.talk

      expect(sample1).not_to eq(sample2)
    end
  end
end
