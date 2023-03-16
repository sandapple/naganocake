class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    #redirect_to admin_item_path(item.id)
  end

  def unsubscribe
  end

  def withdraw
  end

end
