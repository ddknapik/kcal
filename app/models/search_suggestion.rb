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

class SearchSuggestion < ActiveRecord::Base
  attr_accessible :popularity, :term, :kcal

  def self.terms_for(prefix)
  	suggestions = where("term like ?", "#{prefix}_%")
  	result = suggestions.select("term, kcal").order("popularity desc").limit(10)
  	# result = suggestions.order("popularity desc").limit(10).collect{ |suggestion| [suggestion.term, suggestion.kcal] }
  	# suggestions.order("popularity desc").limit(10).collect { |s| puts "#{s.term}"}
  end

  def self.index_products
  	Product.find_each do |product|
  		if (suggestion = SearchSuggestion.where(term: product.name, kcal: product.kcal)).exists?
  			suggestion.popularity.increment!
  		else
  			suggestion.create
  		end
  		# product.name.split.each { |t| index_term(t) }
  	end
  end

end
