class ItemsController < ApplicationController
  before_action :require_admin, only: [:index, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /items
  # GET /items.json
  def index
    set_user
    set_all_items
  end

  # GET /items/1
  # GET /items/1.json
  def show
    set_user
    set_all_items
    set_item
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    set_item
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    set_item
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    set_item
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


private

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
       params.require(:item).permit(:title, :description, :price, :image_url)
    end
end
