class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :destroy]

  def index
    @item = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create

    @Item = Item.new(item_params)
    
    if @Item.save
    redirect_to root_path(@item)
    else
    render :new
    end
  end
end

private

def item_params
  params.require(:item).permit(:item_name,:item_detail,:item_category_id,:item_condition_id,:prefecture_id,:shipping_cost_id,:shipping_days_id)
end