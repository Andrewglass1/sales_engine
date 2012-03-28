module SalesEngine
  class Customer

    attr_accessor :id,
                  :first_name,
                  :last_name,
                  :created_at,
                  :updated_at

    def initialize(attributes={})
      self.id = attributes[:id].to_i
      self.first_name = attributes[:first_name].to_s
      self.last_name = attributes[:last_name].to_s
      self.created_at = attributes[:created_at].to_s
      self.updated_at = attributes[:updated_at].to_s
    end


    def self.customers
      customers = DataStore.instance.customers
    end

    def invoices_array
      invoices = DataStore.instance.invoices
    end

    def transcations_array
      transactions = DataStore.instance.transactions
    end

    def self.random
        self.customers.sample
    end


    def self.method_missing(method_name, *args, &block)
      if method_name =~ /^find_by_(\w+)$/
        Search.find_by_attribute($1, args.first, self.customers)
      elsif method_name =~ /^find_all_by_(\w+)$/
        Search.find_all_by_attribute($1, args.first, self.customers)
      else
        super
      end
    end

    def invoices
      invoices_array.select { |inv| inv.customer_id == id}
    end

    def invoices=(input)
      @invoices = input
    end

    def merchants=(input)
      @merchants = input
    end

    def invoice_ids
      invoice_ids = []
      invoices.each do |inv|
        invoice_ids << inv.id
      end
      invoice_ids
    end

    def transactions
      transcations_array.select {|trans| invoice_ids.include?(trans.invoice_id)}
    end

    def merchants_array
      merchants = []
      invoices.each do |invoice|
        merchants << invoice.merchant_id
      end
      merchants
    end

    def favorite_merchant
      merchants_hash = {}
      merchants_array.each do |merchant|
        if merchants_hash.has_key?(merchant)
          merchants_hash[merchant] += 1
        else
          merchants_hash[merchant] = 1
        end
      end
      merch_id = merchants_hash.max_by{ |merchant, count| count}[0]
      Merchant.find_by_id(merch_id)
    end
  end
end

