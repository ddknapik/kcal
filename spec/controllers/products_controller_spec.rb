require 'spec_helper'

describe ProductsController do
	
	describe "GET index" do
		it "populates an array of products" do
		  product1 = create(:product)
		  product2 = create(:product)
		  get :index
		  expect(assigns(:products)).to match_array [product1, product2]
		end

		it "renders the :index view" do
		  get :index
		  expect(response).to render_template :index
		end
	end

	describe "GET show" do
		before(:each){ @product = create(:product); get :show, id: @product }
		
		it "displays single product with a proper id" do
			expect(assigns(:product)).to eq @product 
		end

		it "renders the :show view" do
		  expect(response).to render_template :show
		end
	end

	describe "GET new" do
		it "assigns a new product to @product" do
		  get :new
		  expect(assigns(:product)).to be_a_new(Product)
		end

		it "render the :new view" do
		  get :new
		  expect(response).to render_template :new
		end
	end

	describe "POST create" do
		context "with valid attributes" do
		  
		  it { expect{ post :create, product: attributes_for(:product) }.to change(Product, :count).by(1) }

		  it "redirects to the product page after creating it" do
		    product = post :create, product: attributes_for(:product)
		    expect(response).to redirect_to products_path
		  end
		end

		context "with invalid attributes" do
		  it { expect{ post :create, product: attributes_for(:product, name: nil) }.to change(Product, :count).by(0) }

		  it "redirects to the product page after creating it" do
		    product = post :create, product: attributes_for(:product, name: nil)
		    expect(response).to render_template :new
		  end
		end
	end

	describe "PUT update" do
		before(:each){ @product = create(:product) }

		it "assigns @product to the proper product" do
		  put :update, id: @product, product: attributes_for(:product)
		  expect(assigns(:product)).to eq @product
		end

		context "valid data entered" do
		  it "updates product attributes" do
		    put :update, id: @product, product: attributes_for(:product, name: "french fries")
		    @product.reload
		    expect(@product.name).to eq "french fries"
		  end

		  it "redirects to products page" do
		  	put :update, id: @product, product: attributes_for(:product)
		  	expect(response).to redirect_to products_path
		  end
		end

		context "invalid data entered" do
			it "doesn't save entered data" do
				put :update, id: @product, product: attributes_for(:product, name: "", kcal: 1212)
				@product.reload
				expect(@product.kcal).not_to eq 1212
			end

		  it "re-render edit page" do
		    put :update, id: @product, product: attributes_for(:product, name: "")
		    expect(response).to render_template :edit
		  end
		end
	end

	describe "DELETE destroy" do
		before(:each){ @product = create(:product) }

		it { expect{ delete :destroy, id: @product }.to change(Product, :count).by(-1) }

		it "redirects to products index" do
			delete :destroy, id: @product
			expect(response).to redirect_to products_path
		end
	end

end