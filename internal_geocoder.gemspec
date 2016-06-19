# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name          = 'internal_geocoder'
  s.licenses      = ['MIT']
  s.version       = '0.0.0'
  s.date          = '2016-06-18'
  s.summary       = 'Geocodes zip_codes and cities'
  s.description   = 'An internal service-independent geocoder - no need for an external api.'
  s.author        = 'Henning Vogt'
  s.email         = 'git@henvo.de'
  s.files         = Dir['lib/**/*', 'bin/*'] + %w(README.md LICENSE)
  s.require_paths = ['lib']
  s.homepage      = 'http://github.com/henvo/internal_geocoder'
  s.add_development_dependency 'rspec', '~> 3.4', '>= 3.4.0'
end
