# Aho-Corasick Matcher

A Ruby gem for finding strings in text using the [Aho-Corasick string matching search](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.96.4671&rep=rep1&type=pdf)

Aho-Corasick is `O(n + m)` where `n` is the size of the string to be searched
and `m` is the size of the dictionary. This means it's particularly suited for
searching for occurances of words using large dictionaries, as the runtime
increases only linearly.

It's quite memory-intensive, and building a matcher is expensive – but once it's
been built, matching terms is very fast.

## Usage

```ruby
require 'aho'

matcher = AhoCorasickMatcher.new(['a', 'b', 'ab'])
matcher.match('aba')
#=> ['a', 'ab', 'b', 'a']
```

## License

Copyright © 2015 Altmetric LLP

Distributed under the MIT License.
