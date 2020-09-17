class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]
  def index
    @items = Item.all.order("created_at DESC")
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
    redirect_to action: :index unless user_signed_in?
  end
end
