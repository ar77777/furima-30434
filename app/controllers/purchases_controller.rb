class PurchasesController < ApplicationController
  before_action :authenticate_user!,  only: :index
  before_action :identification, only: :index
  before_action :sale_check, only: :index
  
  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal, :prefecture_id, :city, :block, :building_name, :phone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  # 　アクセス制限
  def identification
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def sale_check
    @item = Item.find(params[:item_id])
    if @item.purchase != nil && @item.id == @item.purchase.item_id
      redirect_to root_path
    end
  end
end