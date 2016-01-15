# Change Log
All notable changes to this project will be documented in this file. This
project adheres to [Semantic Versioning](http://semver.org/).

## [1.0.2] - 2016-01-15
### Fixed
- Fixed "Stack level too deep" error when inspecting complicated
  AhoCorasickMatcher instances from @mudge.

## [1.0.1] - 2015-06-26
### Changed
- Add compatibility with Ruby 1.8.7 from @mudge;
- Speed up matching by avoiding Object#tap and Object#nil? from @mudge.

## [1.0.0] - 2015-06-15
### Added
- First stable version of Aho-Corasick Matcher.

[1.0.2]: https://github.com/altmetric/aho_corasick_matcher/releases/tag/v1.0.2
[1.0.1]: https://github.com/altmetric/aho_corasick_matcher/releases/tag/v1.0.1
[1.0.0]: https://github.com/altmetric/aho_corasick_matcher/releases/tag/v1.0.0
