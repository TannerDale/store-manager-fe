require 'rails_helper'

describe MerchantPoro do
  let(:data) do
    {
      id: 123,
      attributes: { name: 'Chicken Little' }
    }
  end

  let(:merchant_poro) { MerchantPoro.new(data) }

  it 'exists' do
    expect(merchant_poro).to be_a(MerchantPoro)
  end

  it 'has attributes' do
    expect(merchant_poro.id).to eq(123)
    expect(merchant_poro.name).to eq('Chicken Little')
  end
end
