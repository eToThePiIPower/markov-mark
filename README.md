# Markov Mark

Markov Mark is a Markov chain framework. It began as a very simple
implementation of Markov chains I threw together at a hack night over a 30
minute period, as a first foray into natural language processing. I'm beginning
to grow it out into a fuller "framework" for NLP and/or chat-bots, using
pluggable engines, learning parsers, and actors.

It's still in a very early stage, but I'm hoping to keep development going
forward. I'll soon be adding Parsers for Twitter and possibly other online
services, as well as Actors that can post to online services. Keep an eye on
this space!

A sample output after training on the text of Macbeth (line-by-line):

## Use

Create a new instance
```
require 'engines/markov_engine'
mark = MarkovEngine.new
```

Learn on some text (an arbitrary amount)
```
mark.learn "to be or not to be that is the question"
mark.learn "whether tis nobler in the mind to suffer the slings and arrows of
outrageous fortune"
mark.learn "or to take arms against a sea of troubles and by opposing end them"
```

Generate some text
```
mark.talk
 => "whether tis nobler in the mind to suffer the question"
mark.talk
 => "take arms against a sea of outrageous fortune"
```

Learn from an entire play, or just one speaker
```
require 'parsers/playdoc_parser'
PlaydocParser.parse(File.open('data/macbeth.xml'), engine: mark)
PlaydocParser.parse(File.open('data/macbeth.xml'), engine: mark, speaker: "MACBETH")
```
Parsing on a single engine is cumulative, so you can train on as many individual
plays, speakers, etc. as you want.

## Sample Output

"Again, pray god be lion-mettled, proud; and shoal of fear. Give thee compass'd
with those linen cheeks of most kind hostess; and great king may"

"You'll buy me pale! light thickens; and I pray, be well:"

"Consort with bloody instructions, which, you would make honour both. Go at the
cry 'sleep' no other;"
