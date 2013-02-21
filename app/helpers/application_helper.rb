module ApplicationHelper

	def small_units(unit)
		small_units = { "kg" => "g", "litres" => "ml" }
		return "100#{small_units[unit]}"
	end

end
