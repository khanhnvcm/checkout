class BasketsController < ApplicationController

  def index
    
    @amount = Array.new
    Basket.all.each do |basket|
      @amount << Product.find(basket.product_id).price*basket.quantity
    end
    @total = @amount.sum
  end

  def edit
    @product = Product.find(params[:product_id])
    @basket = Basket.find(params[:id])
  end

  def update
    @basket = Basket.find(params[:id])
    @product = Product.find(@basket.product_id)
    if @basket.update!(basket_params)
      redirect_to index_baskets_path
    else 
      render 'edit'
    end
  end

  def remove
    Basket.all.each do |basket|
      basket.update!(quantity: 0)
    end
    redirect_to index_baskets_path
  end


  private
  def basket_params
  	params.require(:basket).permit(:quantity)
  end
end
