Gem::Specification.new do |s|
  s.name = 'aho_corasick_matcher'
  s.version = '1.0.2'
  s.summary = 'A library to search text for occurrences of a list of strings'
  s.description = <<-EOF
    Uses the fast Aho-Corasick text search system to find occurrences of any of
    a dictionary of strings across an input string.
  EOF
  s.license = 'MIT'
  s.authors = ['Dino']
  s.email = 'dino@beansmile.com'
  s.homepage = 'https://github.com/beansmile/aho_corasick_matcher'
  s.files = Dir['lib/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*.rb']

  s.add_development_dependency('rspec', '~> 3.2')
end
