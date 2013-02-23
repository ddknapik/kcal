# == Schema Information
#
# Table name: search_suggestions
#
#  id         :integer          not null, primary key
#  term       :string(255)
#  popularity :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  kcal       :integer
#

require 'spec_helper'

describe SearchSuggestion do
  pending "add some examples to (or delete) #{__FILE__}"
end
