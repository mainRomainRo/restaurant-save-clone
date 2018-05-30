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
        redirect_to mon_panier_path
      else
        flash.now[:danger] = "Erreur lors de la commande, merci de réessayer."
        redirect_to mon_panier_path
      end
  end

  def payment
    set_cart
    calcul_total
    new_charge
    if @charge.save
      @event.attendees << @user
      flash[:notice] = "Tu as bien rejoint l'évènement !!"
      redirect_to event_path(@event)
    else
      flash[:notice] = "Problème de paiement"
      redirect_to event_path(@event)
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

  def new_charge
    Stripe.api_key = "sk_test_BQokikJOvBiI2HlWgH4olfQ2"
    token = params.require(:stripeToken)

    @charge = Stripe::Charge.create({
        amount: @total*100,
        currency: 'eur',
        description: "User #{@user.id}, order n°#{@event.id}",
        source: token,
    })
  end

end
