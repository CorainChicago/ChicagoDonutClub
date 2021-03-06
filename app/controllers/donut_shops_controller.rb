class DonutShopsController < ApplicationController


  def index
    @shops = DonutShop.all
  end

  def show
    @shop = DonutShop.find(params[:id])
    @donuts = Donut.find_by(:donut_shop_id => @shop.id)
  end

  def create
    @shop = DonutShop.new(shop_params)
    if @shop.save
      redirect_to @shop
    else
      @errors = @shop.errors.full_messages
      render 'donut_shops/new'
    end
  end

  def new_donut_shop_form
    respond_to do |format|
      format.js 
    end
  end


  private

  def shop_params
    params.require(:donut_shop).permit(:name, :description, :address, :phone, :website, :picture)
  end
  
end
