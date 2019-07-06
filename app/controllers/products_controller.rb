class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, except: [:index, :new, :create]

  def index
    @products = current_user.products.all.order("created_at desc")
  end
  #GET /product/:id
    def show
      @product = Product.find(params[:id])
    end
    #GET /product/new
  def new
    @product = Product.new
  end
  #GET /product/:id/edit
  def edit
    @product = Product.find(params[:id])
  end
  #POST /product
  def create
    @product = current_user.products.new(product_params)
    if @product.save
      redirect_to action:"show", id:Product.last.id
    else
      render :new
    end
  end
  #POST /product
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end
  #POST /product/:id
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def validate_user
    redirect_to new_user_session_path, notice: "Necesitas iniciar sesión"
  end

  def product_params
      params.require(:product).permit(:width, :height, :price, :quantity, :description)
  end

end
