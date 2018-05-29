class PagesController < ApplicationController
  def index
    @items = Item.all
  end
  def about
    @items = Item.all
  end
end
