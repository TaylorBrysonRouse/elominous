class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:new, :create]

  # GET /customers
  def index
    @customers = current_user.customers
  end

  # GET /customers/1
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to @customer, notice: "Customer was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customers/1
  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: "Customer was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /customers/1
  def destroy
    @customer.destroy
    redirect_to customers_url, notice: "Customer was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.fetch(:customer, {})
    end
end
