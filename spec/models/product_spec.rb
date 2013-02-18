# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  unit       :string(255)
#  kcal       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'


describe Product do

	describe "validations" do
		let(:empty_product){ Product.new(name: nil, unit: nil, kcal: nil) }

		it { expect(empty_product).to have(1).errors_on(:name) }

		it "product name can't be duplicated" do
		  create(:product, name: "vegetable")
		  product = build(:product, name: "vegetable")
		  expect(product).to have(1).errors_on(:name)
		end

		#unit
		it { expect(empty_product).to have(1).errors_on(:unit) }

		#kcal
		it { expect(empty_product).to have_at_least(1).errors_on(:kcal) }

		it "rejects kcal value less or equal 0" do
		  expect(build(:product, kcal: 0)).to_not be_valid
		end

		it "accepts kcal value more than 0" do
		  expect(build(:product)).to be_valid
		end

		it "rejects kcal if not an integer" do
		  expect(build(:product, kcal: "batko")).to be_invalid
		end

		it "accepts kcal if an integer" do
		  expect(build(:product)).to be_valid
		end

		#all
		it "is valid with all parameters present" do
			expect(build(:product)).to be_valid
		end
	end	
end
