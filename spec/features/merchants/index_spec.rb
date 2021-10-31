require 'rails_helper'

describe 'Merchants Index' do
  let!(:merchants) { build_list :merchant_poro, 40 }

  before :each do
    allow_any_instance_of(MerchantsController).to receive(:merchants).and_return(merchants)

    visit merchants_path
  end

  describe 'displaying merchants' do
    it 'has the first 20', js: true do
      merchants[...20].each do |merchant|
        expect(page).to have_content(merchant.name)
      end
    end
  end
end
