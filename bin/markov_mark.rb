#!/usr/bin/env ruby
root = File.expand_path('../..', __FILE__)
data = "#{root}/data"
lib = "#{root}/lib"
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'engines/markov_engine'
require 'parsers/playdoc_parser'
require 'tools'

mark = MarkovEngine.new
if ARGV.empty?
  PlaydocParser.parse(File.open("#{data}/macbeth.xml"),
                      engine: mark)
else
  ARGV.each do |speaker|
    PlaydocParser.parse(File.open("#{data}/macbeth.xml"),
                        engine: mark,
                        speaker: speaker)
  end
end
puts sentence_case(mark.talk)
