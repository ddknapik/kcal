# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  product    :string(255)
#  unit       :string(255)
#  kcal       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'


describe Product do
	let(:empty_product) { Product.new(product: nil, unit: nil, kcal: nil) }
	let(:product){ Product.new(product: "cheese", unit: "kg", kcal: 1000)}

	#product
	it { expect(empty_product).to have(1).errors_on(:product) }

	it "product name can't be duplicated" do
	  Product.create(product: "cheese", unit: "kg", kcal: 1000)
	  product = Product.new(product: "cheese", unit: "kg", kcal: 1000)
	  expect(product).to have(1).errors_on(:product)
	end

	#unit
	it { expect(empty_product).to have(1).errors_on(:unit) }


	#kcal
	it { expect(empty_product).to have_at_least(1).errors_on(:kcal) }

	it "rejects kcal value less or equal 0" do
	  expect(Product.new(product: "cheese", unit: "kg", kcal: 0)).to_not be_valid
	end

	it "accepts kcal value more than 0" do
	  expect(Product.new(product: "cheese", unit: "kg", kcal: 1)).to be_valid
	end

	it "rejects kcal if not an integer" do
	  expect(Product.new(product: "cheese", unit: "kg", kcal: "batko")).to be_invalid
	end

	it "accepts kcal if an integer" do
	  expect(Product.new(product: "cheese", unit: "kg", kcal: 1)).to be_valid
	end

	
	it "is valid with all parameters present" do
		expect(product).to be_valid
	end
end