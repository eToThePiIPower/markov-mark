load 'markov.rb'
require 'nokogiri'
mark = MarkovChain.new
doc = Nokogiri::XML(File.open('macbeth.xml'))
doc.xpath('//LINE').map(&:text).each do |line|
  line = line.downcase
  mark.learn(line)
end
puts mark.talk
