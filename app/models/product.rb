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

class Product < ActiveRecord::Base
  attr_accessible :kcal, :name, :unit

  validates :name, presence: true, uniqueness: true
  validates :unit, presence: true
  validates :kcal, presence: true, numericality: { greater_than: 0, only_integer: true }

end
