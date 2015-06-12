# Aho-Corasick Matcher [![Build Status](https://travis-ci.org/altmetric/aho.svg?branch=master)](https://travis-ci.org/altmetric/aho)

A Ruby gem for finding strings in text using the [Aho-Corasick string matching search](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.96.4671&rep=rep1&type=pdf)

Aho-Corasick is `O(n + m)` where `ngit pu` is the size of the string to be searched
and `m` is the size of the dictionary. This means it's particularly suited for
searching for occurances of words using large dictionaries, as the runtime
increases only linearly.

It's quite memory-intensive, and building a matcher is expensive – but once it's
been built, matching terms is very fast.

**Current version:** 0.0.1
**Supported Ruby versions:** 1.9.2, 1.9.3, 2.0, 2.1, 2.2, jruby-1.7, rbx-2.2, rbx-2.4

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
