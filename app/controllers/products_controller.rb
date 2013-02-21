class ProductsController < ApplicationController

	def index
		@products = Product.product_search(params[:query]) || []
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

	def edit
		@product = Product.find(params[:id])
		@units = %w{ kg litres }
		render :edit
	end

	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(params[:product])
			redirect_to products_path
		else
			render :edit
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path
	end

end