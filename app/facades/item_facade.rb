class ItemFacade
  class << self
    def items(params = '')
      requested_items(params).map do |item|
        ItemPoro.new(item)
      end
    end

    def item(id)
      ItemPoro.new(ItemService.item(id))
    end

    private

    def requested_items(params)
      if params[:merchant_id]
        ItemService.merchant_items(params[:merchant_id])
      else
        ItemService.items(pagination(params))
      end
    end

    def pagination(params)
      {
        per_page: params[:per_page],
        page: params[:page]
      }
    end
  end
end
