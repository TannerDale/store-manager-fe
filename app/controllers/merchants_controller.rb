class MerchantsController < ApplicationController
  def index
    @page = params[:page]&.to_i || 1
    @merchants = MerchantsSerializer.new(merchants).serializable_hash

    respond_to do |f|
      f.html
      f.json { render json: { merchants: @merchants } }
    end
  end

  def show
    @merchant = MerchantFacade.merchant(params[:id])
    @items = ItemFacade.items(params)
  end

  private

  def merchants
    MerchantFacade.merchants(params)
  end
end
