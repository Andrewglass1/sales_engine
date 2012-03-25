module SalesEngine
  class Item
    #extend SalesEngine::Search
    attr_accessor :id,
                  :name,
                  :description,
                  :unit_price,
                  :merchant_id,
                  :created_at,
                  :updated_at,
                  :total_sold,
                  :total_revenue

    def initialize(attributes={})
      self.id = attributes[:id].to_i
      self.name = attributes[:name].to_s
      self.description = attributes[:description].to_s
      self.unit_price = attributes[:unit_price].to_i
      self.merchant_id = attributes[:merchant_id].to_i
      self.created_at = attributes[:created_at].to_s
      self.updated_at = attributes[:updated_at].to_s
      self.total_sold = 0
      self.total_revenue =0
    end

    def self.items
      items = DataStore.instance.items
    end

    def invoice_items_array
      invoice_items = DataStore.instance.invoice_items
    end

    def merchants_array
      merchants = DataStore.instance.merchants
    end

    def self.random
        self.items.sample
    end

    def self.find_by_id(match)
      SalesEngine::Search.find_all_by("id", match, self.items).sample
    end

    def self.find_all_by_id(match)
      SalesEngine::Search.find_all_by("id", match, self.items)
    end

    def self.find_by_name(match)
      SalesEngine::Search.find_all_by("name", match, self.items).sample
    end

    def self.find_all_by_name(match)
      SalesEngine::Search.find_all_by("name", match, self.items)
    end

    def self.find_by_description(match)
      SalesEngine::Search.find_all_by("description", match, self.items).sample
    end

    def self.find_all_by_description(match)
      SalesEngine::Search.find_all_by("description", match, self.items)
    end

    def self.find_by_unit_price(match)
      SalesEngine::Search.find_all_by("unit_price", match, self.items).sample
    end

    def self.find_all_by_unit_price(match)
      SalesEngine::Search.find_all_by("unit_price", match, self.items)
    end

    def self.find_by_merchant_id(match)
      SalesEngine::Search.find_all_by("merchant_id", match, self.items).sample
    end

    def self.find_all_by_merchant_id(match)
      SalesEngine::Search.find_all_by("merchant_id", match, self.items)
    end

    def self.find_by_updated_at(match)
      SalesEngine::Search.find_all_by("updated_at", match, self.items).sample
    end

    def self.find_all_by_updated_at(match)
      SalesEngine::Search.find_all_by("updated_at", match, self.items)
    end

    def self.find_by_created_at(match)
      SalesEngine::Search.find_all_by("created_at", match, self.items).sample
    end

    def self.find_all_by_created_at(match)
      SalesEngine::Search.find_all_by("created_at", match, self.items)
    end

    def invoice_items
      invoice_items = []
      invoice_items = invoice_items_array.select { |inv| inv.item_id == id}
    end

    def merchant
      merchant = merchants_array.select { |merch| merch.id == merchant_id}
      merchant[0]
    end

    # def item_revenue
    #   revenue = 0
    #   invoice_items.each do |inv_item|
    #     revenue = revenue + inv_item.total
    #   end
    #   revenue
    # end

    # def self.set_revenue
    #   self.items.each do |item|
    #     item.revenue = merchant.item_revenue
    #   end
    # end

    # def self.most_revenue(x)
    #   self.set_revenue
    #   sorted_items = self.items.sort_by { |item| item.revenue }.reverse
    #   sorted_item[0..x-1]
    # end

  end
end