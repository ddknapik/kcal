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
  pending "add some examples to (or delete) #{__FILE__}"
end
