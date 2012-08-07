require 'pry'
require 'sqlite3'
require 'active_record'
require File.expand_path(File.join(File.dirname(__FILE__), %w[.. lib publicize]))

root = File.join(File.dirname(__FILE__),'..')
dbconfig = YAML::load(File.open(File.join(File.dirname(__FILE__),'database.yml')))
ActiveRecord::Base.establish_connection(dbconfig)

Dir.glob(File.join(File.dirname(__FILE__),'mocks/**/*.rb')).each { |f| require f }

RSpec.configure do |config|

end

