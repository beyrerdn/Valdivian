class LineItemsController < ApplicationController

  def create
    item = Item.find(params[:item_id])
    if @cart.items.include?(item)
      line_item = Cart.find_by_item_id(params[:item_id])
      line_item.quantity += 1
    else
      @line_item = LineItem.create(:item_id => item.id, :cart_id => @cart.id)
    end
    redirect_to :back
  end

  def remove_from_cart
    line_item = LineItem.find(params[:line_item_id])
    @cart.line_items.delete(line_item)
    redirect_to :back
  end

end
