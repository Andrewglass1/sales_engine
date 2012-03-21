require './data_store'

class Customer
  attr_accessor :cust_id,
                :first_name,
                :last_name,
                :create_date,
                :update_date

  def initialize(attributes={})
    self.cust_id = attributes[:id].to_s
    self.first_name = attributes[:first_name].to_s
    self.last_name = attributes[:last_name].to_s
    self.create_date = attributes[:created_at].to_s
    self.update_date = attributes[:updated_at].to_s
  end


  def self.customers
    customers = []
    ObjectSpace.each_object(Customer) {|o| customers<<o}
    customers
  end

  def self.random
    random = rand(self.customers.count)
    self.customers[random].first_name
    puts self.customers[random].first_name
  end

  def self.find_by_cust_id(match)
    found = []
    found = self.customers.select |customer|
      if customer.cust_id == match
        found <<customer
      end
    end
    found[rand(found.count)]
    puts found[rand(found.count)].cust_id
  end

  def self.find_all_by_cust_id(match)
    found = []
    found = self.customers.each do |customer|
      if customer.cust_id == match
        found <<customer
      end
    end
    found
    puts found
  end

  def self.find_by_first_name(match)
    found = []
    found = self.customers.each do |customer|
      if customer.first_name == match
        found <<customer
      end
    end
    found[rand(found.count)]
    puts found[rand(found.count)].first_name
  end

  def self.find_all_by_first_name(match)
    found = []
    found = self.customers.each do |customer|
      if customer.first_name == match
        found <<customer
      end
    end
    found
    puts found
  end

  def self.find_by_last_name(match)
    found = []
    found = self.customers.each do |customer|
      if customer.last_name == match
        found <<customer
      end
    end
    found[rand(found.count)]
    puts found[rand(found.count)].last_name
  end

  def self.find_all_by_last_name(match)
    found = []
    found = self.customers.each do |customer|
      if customer.last_name == match
        found <<customer
      end
    end
    found
    puts found
  end

  def self.find_by_create_date(match)
    found = []
    found = self.customers.each do |customer|
      if customer.create_date == match
        found <<customer
      end
    end
    found[rand(found.count)]
    puts found[rand(found.count)].create_date
  end

  def self.find_all_by_create_date(match)
    found = []
    found = self.customers.each do |customer|
      if customer.create_date == match
        found <<customer
      end
    end
    found
    puts found
  end

  def self.find_by_update_date(match)
    found = []
    found = self.customers.each do |customer|
      if customer.update_date == match
        found <<customer
      end
    end
    found[rand(found.count)]
    puts found[rand(found.count)].update_date
  end

  def self.find_all_by_update_date(match)
    found = []
    found = self.customers.each do |customer|
      if customer.update_date == match
        found <<customer
      end
    end
    found
    puts found
  end
end

