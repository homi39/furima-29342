class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]
  def index
    @items = Item.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item.user_id)
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :category_id, :price, :text, :status_id, :shipping_cost_id, :shipping_area_id, :scheduled_shipping_date_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end