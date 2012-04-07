
begin
  require 'bones'
rescue LoadError
  abort '### Please install the "bones" gem ###'
end

task :default => 'test:run'
task 'gem:release' => 'test:run'

Bones {
  name     'publicize'
  authors  'David Keener'
  email    'dkeener@keenertech.com'
  url      'https://github.com/dkeener/publicize'

  depend_on  'rspec', '~> 2.7.0', :development => true
}

