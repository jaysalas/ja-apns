# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ja-apns}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Yuriy Kharchenko", "James Pozdena"]
  s.autorequire = %q{apns}
  s.date = %q{2013-06-26}
  s.description = %q{Simple Apple push notification service gem}
  s.email = %q{yuri.kharchenko@gmail.com}
  s.extra_rdoc_files = ["MIT-LICENSE"]
  s.files = ["MIT-LICENSE", "README.textile", "Rakefile", "lib/apns", "lib/apns/packager.rb", "lib/apns/sender.rb", "lib/apns.rb"]
  s.homepage = %q{http://github.com/letmein/ja-apns}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Just another simple Apple push notification service gem}

  s.add_development_dependency 'rspec'
end
