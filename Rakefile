require 'rubygems'
require 'rake'
require 'rake/rdoctask'
require 'rake/gempackagetask'
require 'spec/rake/spectask'

spec = Gem::Specification.new do |s|
  s.name     = 'rack-amf'
  s.version  = '2.0.0'
  s.summary  = 'AMF gateway packaged as a rack middleware'
  s.authors  = ['Stephen Augenstein']
  s.email    = 'perl.programmer@gmail.com'
  s.homepage = 'http://github.com/warhammerkid/rack-amf'

  s.platform     = Gem::Platform::RUBY
  s.rdoc_options << '--line-numbers' << '--main' << 'README.rdoc'
  s.rdoc_options += FileList['README.rdoc']
  s.files        = FileList['README.rdoc', 'Rakefile', 'lib/**/*.rb', 'spec/**/*.{rb,opts}']
  s.test_files   = Dir[*['spec/**/*_spec.rb']]

  s.add_dependency 'RocketAMF', '>= 0.2.0'
end

desc 'Default: Run the specs'
task :default => :spec

Rake::GemPackageTask.new(spec).define

desc "Generate documentation"
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'rack-amf'
  rdoc.options  = spec.rdoc_options
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Spec::Rake::SpecTask.new do |t|
  t.spec_opts = ['--options', 'spec/spec.opts']
end

desc 'Generate a gemspec file'
task :gemspec do
  File.open("#{spec.name}.gemspec", 'w') do |f|
    f.write spec.to_ruby
  end
end