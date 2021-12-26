class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @card_address = CardAddress.new
  end

  def create
    @card_address = CardAddress.new(card_params)
    if @card_address.valid?
      @card_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def card_params
    params.require(:card_address).permit(:post_code, :prefecture_id, :city, :address, :phone_number, :building_name).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end