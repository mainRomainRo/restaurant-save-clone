class ChatonMailer < ApplicationMailer

  def order_with_photos
    @subject = "Et voila votre commande ! 😺 👯‍ ☄️"
    if params[:user] && params[:order] && params[:total]
      p "user valid && order exists!"
      @user = params[:user]
      @order = params[:order]
      @total = params[:total]
      p "Sending mail now ..."
      mail(to: @user.email, subject: @subject, delivery_method_options: { api_key: ENV['MAILJET_API'], secret_key: ENV['MAILJET_SECRET'] })
      p "Mail to customer sent."
    else
      p "error somewhere!"
    end
  end

  def order_to_customer
    @subject = "Bonjour & Merci 😱 🤯 😈‍"
    if params[:user] && params[:order] && params[:total]
      p "user valid && order exists!"
      @user = params[:user]
      @order = params[:order]
      @total = params[:total]
      p "Sending mail now ..."
      mail(to: @user.email, subject: @subject, delivery_method_options: { api_key: ENV['MAILJET_API'], secret_key: ENV['MAILJET_SECRET'] })
      p "Mail to customer sent."
    else
      p "error somewhere!"
    end
  end

  def order_to_admin
    @subject = "Nouvelle commande GROS 🍓💦 🤷‍‍"
    if params[:user] && params[:order] && params[:total]
      p "order exists for a specific user!"
      @user = params[:user]
      @order = params[:order]
      @total = params[:total]
      p "Sending mail now ..."
      mail(to: "restaurantsfromparis@gmail.fr", subject: @subject, delivery_method_options: { api_key: ENV['MAILJET_API'], secret_key: ENV['MAILJET_SECRET'] } )
      p "Mail to admin sent."
    else
      p "something wrong here!"
    end
  end

  def info_to_admin
    @subject = "Les sousous 💰"
    if params[:orders] && params[:items] && params[:money]
      @orders = params[:orders]
      @items = params[:items]
      @money = params[:money]
      p "datas exists!"
      p "Sending mail now ..."
      mail(to: "restaurantsfromparis@gmail.com", subject: @subject, delivery_method_options: { api_key: ENV['MAILJET_API'], secret_key: ENV['MAILJET_SECRET'] })
      p "Mail to admin sent."
    else
      p "something wrong here!"
    end
  end


end
