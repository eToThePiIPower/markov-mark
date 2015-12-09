# Markov Mark

Markov Mark is a Markov chain. At the moment, it's a very simple implementation
I threw together at a mini-hackathon over 20 minutes. As such, there are no
tests, no refactoring, and no guarantees.

That said, I plan to continue working on it bit by bit, and perhaps eventually
turn it into a Twitter bot. As this is my first time experimenting with NLP, its
going to be fun :D

A sample output after training on the text of Macbeth (line-by-line):

## Use

Create a new instance
```
mark = MarkovChain.new
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

## Sample Output

"Again, pray god be lion-mettled, proud; and shoal of fear. Give thee compass'd
with those linen cheeks of most kind hostess; and great king may"

"You'll buy me pale! light thickens; and I pray, be well:"

"Consort with bloody instructions, which, you would make honour both. Go at the
cry 'sleeep' no other;"
