module SalesEngine
  class Transaction
    attr_accessor :id,
                  :invoice_id,
                  :credit_card_number,
                  :credit_card_expiration_date,
                  :result,
                  :created_at,
                  :updated_at

    def initialize(attributes={})
      self.id = attributes[:id].to_i
      self.invoice_id = attributes[:invoice_id].to_i
      self.credit_card_number = attributes[:credit_card_number].to_s
      self.credit_card_expiration_date = attributes[:credit_card_expiration_date].to_s
      self.result = attributes[:result].to_s
      self.created_at = attributes[:created_at].to_s
      self.updated_at = attributes[:updated_at].to_s
    end

    def self.transactions
      DataStore.instance.transactions
    end

    def self.random
        self.transactions.sample
    end

    def invoices_array
      invoices = DataStore.instance.invoices
    end

    def invoice
      invoices_array.detect { |inv| inv.id == invoice_id}
    end

  end
end