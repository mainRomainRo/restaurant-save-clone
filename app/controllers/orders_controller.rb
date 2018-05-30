class OrdersController < ApplicationController

  def create
    set_user
    calcul_total
    @order = Order.new(user: current_user)
    @order.purchased_items << current_user.added_items
      if @order.save
        ChatonMailer.with(user: @user, total: @total, order: @order).order_to_customer.deliver_now
        ChatonMailer.with(user: @user, total: @total, order: @order).order_to_admin.deliver_now
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
