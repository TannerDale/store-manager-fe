require 'rails_helper'

describe 'Merchant Show Page' do
  let(:merchant) { build :merchant_poro }
  let(:items) { build_list :item_poro, 5 }

  before :each do
    allow(MerchantFacade).to receive(:merchant).and_return(merchant)
    allow(ItemFacade).to receive(:items).and_return(items)

    visit merchant_path(merchant.id)
  end

  describe 'page info' do
    it 'has the merchants name' do
      expect(page).to have_content(merchant.name)
    end

    it 'has the merchants items' do
      items.each do |item|
        expect(page).to have_content(item.name)
        expect(page).to have_content(item.description)
        expect(page).to have_content(item.unit_price)
      end
    end
  end
end
