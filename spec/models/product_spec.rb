require './spec/spec_helper'

describe Product do
  before do
    @product_a = create :product_a
  end

  it 'can find by name' do
    product = Product.find_by name: @product_a.name

    expect(product).to_not be_nil
    expect(product[:name]).to eq(@product_a.name)
    expect(product[:brand]).to eq(@product_a.brand)
    expect(product[:company]).to eq(@product_a.company)
    expect(product[:created_at]).to_not be_nil
    expect(product[:updated_at]).to_not be_nil
  end
end
