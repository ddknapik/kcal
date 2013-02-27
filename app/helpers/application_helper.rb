module ApplicationHelper

	def small_units(unit)
		small_units = { "kg" => "g", "litres" => "ml" }
		return "100#{small_units[unit]}"
	end

	def active_link?(c, a)
		"active" if current_page?(controller: c, action: a) 
	end

end
