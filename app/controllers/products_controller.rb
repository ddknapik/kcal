class ProductsController < ApplicationController

	def index
		@products = Product.all
		render :index
	end

	def show
		@product = Product.find(params[:id])
		render :show
	end

	def new
		@product = Product.new
		@units = %w{ kg litres }
		render :new
	end

	def create
		@product = Product.new(params[:product])		
		if @product.save
			redirect_to products_path
		else
			render :new
		end
	end

end