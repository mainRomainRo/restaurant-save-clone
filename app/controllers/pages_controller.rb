class PagesController < ApplicationController
  def index
    @items = Item.all
    @user = current_user
  end
  def about
    @items = Item.all
    @user = current_user
  end
  def admin
    @items = Item.all
    @user = current_user
    @users = User.all
  end
end
