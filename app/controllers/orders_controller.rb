class OrdersController < ApplicationController

  def create
    @order = Order.new(user: current_user)
    @order.purchased_items << current_user.added_items
      if @order.save
        current_user.cart.destroy
        redirect_to mon_panier_path
      else
        flash.now[:danger] = "Erreur lors de la commande, merci de réessayer."
        redirect_to mon_panier_path
      end
  end

  def show

  end

end
