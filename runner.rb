$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib')).uniq!

require 'sales_engine'
include SalesEngine

SalesEngine.startup
n = SalesEngine::Customer.find_by_id(9)
puts n.inspect
puts n.favorite_merchant.inspect