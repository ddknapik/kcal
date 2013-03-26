class Message
	include ActiveModel::Validations
	include ActiveModel::Conversion
	extend ActiveModel::Naming

	attr_accessor :name, :email, :subject, :body

	validates_presence_of :name, :email, :subject, :body

	def initialize(attributes = {})
		attributes.each{ |name, value| send("#{name}=", value) }
	end

	def persisted?
		false		
	end
end