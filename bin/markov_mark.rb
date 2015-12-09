#!/usr/bin/env ruby
data = File.expand_path('../../data', __FILE__)
lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'markov_chain'
require 'nokogiri'

mark = MarkovChain.new
doc = Nokogiri::XML(File.open("#{data}/macbeth.xml"))
doc.xpath('//LINE').map(&:text).each do |line|
  line = line.downcase
  mark.learn(line)
end
puts mark.talk
