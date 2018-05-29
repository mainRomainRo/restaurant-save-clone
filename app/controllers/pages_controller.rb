class PagesController < ApplicationController
  def index
    @items = Item.all
    @user = current_user
    @added_items = @user.added_items
  end
  def about
    @items = Item.all
    @user = current_user
  end
end
