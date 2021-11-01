require 'rails_helper'

describe MerchantFacade do
  let(:data) do
    [
      {
        id: 1,
        attributes: { name: 'Hello' }
      },
      {
        id: 2,
        attributes: { name: 'Rick' }
      },
      {
        id: 3,
        attributes: { name: 'Astley' }
      }
    ]
  end

  before :each do
    allow(MerchantFacade).to receive(:pagination).and_return({})
    allow(MerchantService).to receive(:merchants).and_return(data)
    allow(MerchantService).to receive(:merchant).and_return(data.first)
  end

  it '#merchants returns an array or merchant_poros' do
    result = MerchantFacade.merchants
    all_poros = result.all? { |m| m.is_a?(MerchantPoro) }

    expect(result.size).to eq 3
    expect(result).to be_an Array
    expect(all_poros).to be true
  end

  it '#merchant returns a single merchant_poro' do
    result = MerchantFacade.merchant(1)

    expect(result).to be_a MerchantPoro
    expect(result.name).to eq('Hello')
  end
end
