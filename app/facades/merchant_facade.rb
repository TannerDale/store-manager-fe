class MerchantFacade
  class << self
    def merchants(params = '')
      data = MerchantService.merchants(pagination(params))
      data.map do |merchant|
        MerchantPoro.new(merchant)
      end
    end

    def merchant(id)
      MerchantPoro.new(MerchantService.merchant(id))
    end

    private

    def pagination(params)
      {
        per_page: params[:per_page],
        page: params[:page]
      }
    end
  end
end
