class OrdersController < ApplicationController

  def new
    set_user
    @order = Order.new
  end

  def create
    set_user
    @order = Order.new(user: current_user)
    @order.purchased_items << current_user.added_items
      if @order.save
        current_user.cart.destroy
        flash[:success] = "Le paiement a été enregistré, la commande passe en préparation... Surveillez votre boîte mail : #{@user.email} !"
        redirect_to mon_panier_path
      else
        flash[:danger] = "Erreur lors de la commande, merci de réessayer."
        redirect_to mon_panier_path
      end
  end


  def show
  end

  private

  def calcul_total
    @total = 0
    @cart.added_items.each do |item|
      @total += item.price
    end
    return @total
  end

end
