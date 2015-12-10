require 'nokogiri'
require 'open-uri'
require 'tools'

# Parser for literary plays in XML format
class PlaydocParser
  def self.parse(doc, engine:, speaker: nil)
    playdoc = Nokogiri::XML(doc)
    playdoc.xpath('//SPEECH').each do |speech|
      next if !speaker.nil? && speech.css('SPEAKER').text != speaker
      lines = speech.css('LINE').map(&:text).join(' ')
      lines = sentence_case(lines)
      engine.learn(lines)
    end
  end
end
