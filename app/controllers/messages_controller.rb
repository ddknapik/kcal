class MessagesController < ApplicationController
	
	def new
		@message = Message.new
	end

	def create
		@message = Message.new(params[:message])
		if @message.valid?
			ContactMailer.private_email(@message).deliver
			redirect_to root_url, notice: "Thank you, your e-mail message has been sent successfully!"
		else
			flash[:error] = "Sorry, something went wrong..."
			render :new
		end
	end

end