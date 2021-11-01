require 'rails_helper'

describe ItemFacade do
  let(:data) do
    [
      {
        id: 1,
        attributes: {
          name: 'Hello'
        }
      },
      {
        id: 2,
        attributes: {
          name: 'Chicken'
        }
      },
      {
        id: 3,
        attributes: {
          name: 'Nugget'
        }
      }
    ]
  end

  before :each do
    allow(ItemFacade).to receive(:requested_items).and_return(data)
    allow(ItemService).to receive(:item).and_return(data.first)
  end

  it '#items makes an array of item_poros' do
    result = ItemFacade.items
    all_poros = result.all? { |i| i.is_a?(ItemPoro) }

    expect(result).to be_an Array
    expect(result.size).to eq 3
    expect(all_poros).to be true
  end

  it '#item makes a single item_poro' do
    result = ItemFacade.item(1)

    expect(result).to be_an ItemPoro
  end
end
