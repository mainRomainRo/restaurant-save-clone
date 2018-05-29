class PagesController < ApplicationController
  def index
    @items = Item.all
    @user = current_user
    if user_signed_in?
      @added_items = @user.added_items
    end
  end

  def about
    @items = Item.all
    @user = current_user
  end
end
