require 'spec_helper'
require 'tools'

describe 'sentence_case' do
  it 'capitalizes the first word of each sentence' do
    string = 'hello there! who Are you? i think i know you. how about it macbeth?'
    expected = 'Hello there! Who are you? I think I know you. How about it Macbeth?'

    parsed = sentence_case(string, propers: ['Macbeth'])

    expect(parsed).to eq(expected)
  end
end
