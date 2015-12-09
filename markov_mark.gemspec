lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'Markov Mark'
  spec.version       = '0.1'
  spec.authors       = ['Charles Beynon']
  spec.email         = ['eToThePiIPower@gmail.com']
  spec.summary       = 'A Markov Chain framework'
  spec.description   = 'A collection of Markov engines, parsers to feed them
    learning data, and bots to make use of them'
  spec.homepage      = 'https://github.com/eToThePiIPower/markov-mark'
  spec.license       = 'MIT'
  spec.require_paths = ['lib']
end
