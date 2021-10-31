class MerchantsController < ApplicationController
  def index
    @merchants = MerchantFacade.merchants(params)
  end

  def show
    @merchant = MerchantFacade.merchant(params[:id])
    @items = ItemFacade.items(params)
  end
end
