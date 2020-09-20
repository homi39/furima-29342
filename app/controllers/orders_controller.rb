class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.create(params[:item_id])
    @order = @item.order.new(order_params)
    if @order.valid?
      pay_item 
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:price, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency:'jpy'
    )
  end
end
