class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_index, only: [:index]
  def index
    @item = Item.find(params[:item_id])
    @card_address = CardAddress.new
    redirect_to root_path if current_user == @item.user
  end

  def create
    @card_address = CardAddress.new(card_params)
    @item = Item.find(params[:item_id])
    if @card_address.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.item_price,
        card: card_params[:token],
        currency: 'jpy'
      )
      @card_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def card_params
    params.require(:card_address).permit(:post_code, :prefecture_id, :city, :address, :phone_number, :building_name).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path
  end
end
