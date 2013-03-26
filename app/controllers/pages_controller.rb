class PagesController < ApplicationController

	def about
		render :about
	end

	def contact
		@contact = nil
		render :contact
	end

end