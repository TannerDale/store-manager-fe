class MerchantService
  class << self
    def merchants(params = '')
      params = format_params(params)
      EngineClient.fetch("#{base_url}?#{params}")[:data]
    end

    def merchant(id)
      EngineClient.fetch("#{base_url}/#{id}")[:data]
    end

    private

    def format_params(params)
      params.filter_map do |key, value|
        "#{key}=#{value}" if value
      end.join('&')
    end

    def base_url
      '/api/v1/merchants'
    end
  end
end
