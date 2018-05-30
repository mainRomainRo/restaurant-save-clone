desc "Envoi des infos essentielles : MONEY"
  task chaton1: :environment do
    @orders = 0
    @items_purchased = 0
    @money_win = 0
    users = User.all
    p "recherche des informations sensibles"
    users.each do |user|
      if user.orders
        user.orders.each do |order|
          @orders += 1
          order.purchased_items.each do |item|
            @items_purchased += 1
            @money_win += item.price
          end
        end
      end
    end
    p "informations récupérées && envoi du mail"
    ChatonMailer.with(orders: @orders, items: @items_purchased, money: @money_win).info_to_admin.deliver_now
    p "informations envoyées"
    p "a une prochaine les boy'z"
  end

desc "Tests de l'envoi des jolis mails"
  task chaton2: :environment do
    @order = Order.last
    @user = User.last
    @total = 0
    @order.purchased_items.each do |item|
      @total += item.price
    end
    p "informations récupérées && envoi du mail"
    ChatonMailer.with(order: @order, total: @total, user: @user).order_to_customer.deliver_now
    ChatonMailer.with(order: @order, total: @total, user: @user).order_to_admin.deliver_now
    p "informations envoyées"
  end
