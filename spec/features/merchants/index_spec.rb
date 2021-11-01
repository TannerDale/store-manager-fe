require 'rails_helper'

describe 'Merchants Index' do
  let!(:merchants) { build_list :merchant_poro, 40 }
  let(:items) { build_list :item_poro, 2 }

  before :each do
    allow_any_instance_of(MerchantsController).to receive(:merchants).and_return(merchants)
    allow(MerchantFacade).to receive(:merchant).and_return(merchants.first)
    allow(ItemFacade).to receive(:items).and_return(items)

    visit merchants_path
  end

  describe 'displaying merchants' do
    it 'has links for the first 20 merchants', js: true do
      merchants[...20].each do |merchant|
        expect(page).to have_link(merchant.name)
      end
      expect(page).to have_content('Page: 1')
    end

    it 'can cycle to the next 20 merchants', js: true do
      click_button 'Next'

      merchants[20..].each do |merchant|
        expect(page).to have_link(merchant.name)
      end

      expect(page).to have_content('Page: 2')
    end

    it 'can cycle up and down pages', js: true do
      click_button 'Next'
      click_button 'Next'

      expect(page).to have_content('Page: 3')

      click_button 'Previous'

      expect(page).to have_content('Page: 2')

      click_button 'Previous'

      expect(page).to have_content('Page: 1')
    end

    it 'links to the merchants show page', js: true do
      click_link merchants.first.name

      expect(current_path).to eq(merchant_path(merchants.first.id))
      expect(page).to have_content(merchants.first.name)
    end
  end
end
