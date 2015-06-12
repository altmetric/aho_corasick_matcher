# Aho-Corasick Matcher

A Ruby gem for finding strings in text using the [Aho-Corasick string matching search](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.96.4671&rep=rep1&type=pdf)

## Usage

```ruby
require 'aho_corasick'

# Basic usage
matcher = AhoCorasickMatcher.new(['a', 'b', 'ab'])
matcher.match('aba')
#=> ['a', 'ab', 'b', 'a']
```

## License

Copyright © 2015 Altmetric LLP

Distributed under the MIT License.
