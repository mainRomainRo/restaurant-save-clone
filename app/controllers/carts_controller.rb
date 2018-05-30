class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy, :index, :add_to_cart, :delete_to_cart]
  # GET /carts
  before_action :require_login, only: [:show, :edit, :update, :destroy, :index, :add_to_cart, :delete_to_cart]


  # GET /carts.json
  def index
      @user = current_user
      @items = @user.added_items
      if Cart.where(user: @user)
        @total = calcul_total
      end
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    @item = Item.all.find_by(id: params[:id])
      respond_to do |f|
        f.js   { render :layout => false }
        f.html { redirect_to root_url }
        f.json { head :no_content }
      end

  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @cart.added_items.delete(set_item)
    respond_to do |format|
      format.html { redirect_to mon_panier_path, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_to_cart
    set_item
    if @cart.added_items << @item
      flash.now[:success] = "Element ajouté à votre panier"
      redirect_to mon_panier_path
    end
  end

  def delete_to_cart
    @cart = Cart.find(cart_params[:cart])
    @item = CartItem.find(cart_params[:item])
    @cart.cart_items.destroy(@item)
    redirect_to mon_panier_path
  end

  def calcul_total
    @total = 0
    @cart.added_items.each do |item|
      @total += item.price
    end
    return @total
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      if user_signed_in? && current_user.cart
        @cart = current_user.cart
      elsif user_signed_in?
        @cart = Cart.create(user: current_user)
      elsif @cart = Cart.find_by(id: session[:cart_id])
      else
        flash[:error] = "Merci de vous connecter pour accéder à cette page."
        redirect_to new_user_session_path
        # p session[:session_id]
        # @cart = Cart.create(user: session[:session_id])
        # session[:cart_id] = @cart.id
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.permit(:cart, :item)
    end




end
