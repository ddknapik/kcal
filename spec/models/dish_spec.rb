# == Schema Information
#
# Table name: dishes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  ingredient :integer
#  calorific  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Dish do
	describe "validations" do
		it { expect(build(:dish, name: nil)).to  have(1).errors_on(:name) }
	end
end
