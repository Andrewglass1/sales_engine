require 'csv'
require 'bundler'
require './customer'
require './invoice'
require './merchant'
require './invoice_item'
require './item'
require './transaction'
require './data_store'

class SalesEngine

  def initialize
    data = DataStore.new
  end
end



se = SalesEngine.new
#Customer.random
Customer.find_by_update_date("2012-02-26 20:57:34 UTC")
#Customer.find_all_by_cust_id(3)
#se.customers.random
#customer_instance = Customer.new(customers)
#customer_instance.random
#singleton
