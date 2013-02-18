FactoryGirl.define do
	factory :product do
		sequence(:name){ |p| "vegetable#{p}" }
		unit "kg"
		kcal { Random.new.rand(1..1000) }
	end

	factory :invalid do
		name ""
		unit ""
		kcal ""
	end
end