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

class Dish < ActiveRecord::Base
  attr_accessible :calorific, :ingredient, :name
end
