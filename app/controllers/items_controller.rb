class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update]
  before_action :move_to_index, except: [:index, :show]
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
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

  def find_item
    @item = Item.find(params[:id])
  end
end
