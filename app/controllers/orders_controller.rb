class OrdersController < ApplicationController

  def create
    @order = Order.new(user: current_user)
    @order.purchased_items << current_user.added_items
      if @order.save
        p "Woohooo trop bien !"
        current_user.cart.destroy
        redirect_to mon_panier_path
      else
        p "oh nooooes c'est raatééééééé"
        redirect_to mon_panier_path
      end
  end

  def show

  end

end
