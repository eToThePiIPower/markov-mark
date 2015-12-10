require 'spec_helper'
require 'playdoc_parser'

describe PlaydocParser do
  describe '.parse' do
    it 'parses the entire document' do
      engine = double('engine')
      allow(engine).to receive(:learn)

      PlaydocParser.parse(File.open('spec/data/playdoc.xml'), engine: engine)

      expect(engine).to have_received(:learn)
        .with(/When shall we three meet again/)
    end

    context 'when givent a speaker' do
      it "only parses the given speaker's lines" do
        engine = double('engine')
        allow(engine).to receive(:learn)

        PlaydocParser.parse(File.open('spec/data/playdoc.xml'),
                            speaker: 'First Witch',
                            engine: engine)

        expect(engine).to have_received(:learn)
          .with(/When shall we three meet again/)
        expect(engine).to have_received(:learn)
          .with(/Where the place/)
        expect(engine).not_to have_received(:learn)
          .with(/hurlyburly/)
      end
    end
  end
end
