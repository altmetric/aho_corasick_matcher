Gem::Specification.new do |s|
  s.name = 'aho'
  s.version = '0.0.1'
  s.summary = 'A library to search text for occurances of a list of strings'
  s.description = <<-EOF
    Uses the fast Aho-Corasick text search system to find occurances of any of
    a dictionary of strings across an input string.
  EOF
  s.license = 'MIT'
  s.authors = ['Matthew MacLeod']
  s.email = 'support@altmetric.com'
  s.homepage = 'https://github.com/altmetric/aho'
  s.files = %w(README.md LICENSE lib/aho.rb)
  s.test_files = Dir['spec/**/*.rb']
  s.require_paths = ['lib']

  s.add_development_dependency('rspec', '~> 3.2')
end
