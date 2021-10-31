class ItemService
  class << self
    def items(params = '')
      params = format_params(params)
      EngineClient.fetch("/api/v1/items?#{params}")[:data]
    end

    def merchant_items(merchant_id)
      EngineClient.fetch("/api/v1/merchants/#{merchant_id}/items")[:data]
    end

    private

    def format_params(params)
      params.filter_map do |key, value|
        "#{key}=#{value}" if value
      end.join('&')
    end
  end
end
