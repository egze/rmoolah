module Rmoolah
  
  class Transaction
    
    include HTTParty
    
    base_uri 'https://moolah.io'
    
    class << self
      def fetch(tx)
        self.new(nil, nil, nil, nil, nil).fetch(tx)
      end
    end
    
    attr_reader :tx,
                :address,
                :amount_requested,
                :currency_requested,
                :amount_to_pay,
                :currency_to_pay,
                :url,
                :guid,
                :product,
                :return_url,
                :ipn,
                :status,
                :received
    
    def initialize(guid, amount_requested, currency_requested, product, return_url, ipn = nil)
      @guid               = guid
      @amount_requested   = amount_requested
      @currency_requested = currency_requested
      @product            = product
      @return_url         = return_url
      @ipn                = ipn
    end
    
    def create
      response = self.class.get("/api/pay", query: {
        guid: guid,
        amount: amount_requested,
        currency: currency_requested,
        product: product,
        return: return_url
      })
      update!(response.body)
      self
    end

    def fetch(tx = @tx)
      response = self.class.get("/api/pay/check/#{tx}")
      update!(response.body)
      self
    end
    
    private
    def update!(json)
      h = JSON.parse(json)
      @status           ||= h['status']
      @tx               ||= h['tx']
      @url              ||= h['url']
      @address          ||= h['address']
      @amount_to_pay    ||= h['amount']
      @currency_to_pay  ||= h['currency']
      @received         ||= h['received']
      self
    end
    
  end
  
end
