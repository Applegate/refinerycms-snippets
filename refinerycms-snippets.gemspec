Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = %q{refinerycms-snippets}
  s.version           = %q{2.0.0}
  s.description       = %q{Ruby on Rails Snippets engine for Refinery CMS}
  s.date              = %q{2012-02-25}
  s.summary           = %q{Html snippets for Refinery CMS page}
  s.authors           = ['Marek L.', 'Rodrigo Garcia Suarez', 'Pritesh Mehta']
  s.email             = %q{nospam.keram@gmail.com}
  s.require_paths     = %w(lib)

  s.add_dependency    'refinerycms-pages', '>= 2.0.0'
  s.add_development_dependency    'rspec'

  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- spec/*`.split("\n")
end
