class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_item, only: [:edit, :update, :show, :destory]
  before_action :move_to_index, only: [:edit, :destory]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path if @item.card.present?
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_detail, :item_category_id, :item_condition_id, :prefecture_id,
                                 :shipping_cost_id, :shipping_days_id, :item_price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @item.user_id
  end
end
