class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer, except: [:index, :new, :create]

  def index
    @customers = current_user.customers.all
  end
  #GET /customer/:id
    def show
      @customer = Customer.find(params[:id])
      @order = Order.new
    end
    #GET /customer/new
  def new
    @customer = Customer.new
  end
  #GET /customer/:id/edit
  def edit
    @customer = Customer.find(params[:id])
  end
  #POST /customer
  def create
    @customer = current_user.customers.new(customer_params)
    if @customer.save
      redirect_to action:"show", id:Customer.last.id
    else
      render :new
    end
  end
  #POST /customer
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_path
  end
  #POST /customer/:id
  def update
    if @customer.update(customer_params)
      redirect_to @customer
    else
      render :edit
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def validate_user
    redirect_to new_user_session_path, notice: "Necesitas iniciar sesión"
  end

  def customer_params
      params.require(:customer).permit(:names, :surnames, :email)
  end

end
