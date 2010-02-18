require 'machinist/active_record'
require 'sham'
require 'faker'

Dir["#{RAILS_ROOT}/test/blueprints/*.rb"].each { |f| require f }