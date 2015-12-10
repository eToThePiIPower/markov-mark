require 'spec_helper'
require 'tools'

describe 'sentence_case' do
  it 'capitalizes the first word of each sentence' do
    string = 'hello there! who are you? i think i know you. how about it?'
    expected = 'Hello there! Who are you? I think i know you. How about it?'

    parsed = sentence_case(string)

    expect(parsed).to eq(expected)
  end
end
