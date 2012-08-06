require 'pry'
require 'sqlite3'
require File.expand_path(File.join(File.dirname(__FILE__), %w[.. lib publicize]))

Dir.glob(File.join(File.dirname(__FILE__),'mocks/**/*.rb')).each { |f| require f }

binding.pry

RSpec.configure do |config|

end

