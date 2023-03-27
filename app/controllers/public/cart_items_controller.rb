class Public::CartItemsController < ApplicationController
  def index
    @cartitems = CartItem.all
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.save
    #redirect_to admin_items_path(item.id)
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    #redirect_to admin_item_path(item.id)
  end

  def destroy
  end

  def destroy_all
  end
end
