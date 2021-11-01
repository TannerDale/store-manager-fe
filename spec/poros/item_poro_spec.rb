require 'rails_helper'

describe ItemPoro do
  let(:data) do
    {
      id: 11,
      attributes: {
        name: 'Hello',
        description: 'Whats up doc',
        unit_price: 11_111,
        merchant_id: 2
      }
    }
  end
  let(:item_poro) { ItemPoro.new(data) }

  it 'exists' do
    expect(item_poro).to be_an(ItemPoro)
  end

  it 'has attributes' do
    expect(item_poro.id).to eq(11)
    expect(item_poro.name).to eq('Hello')
    expect(item_poro.description).to eq('Whats up doc')
    expect(item_poro.unit_price).to eq(11_111)
    expect(item_poro.merchant_id).to eq(2)
  end
end
