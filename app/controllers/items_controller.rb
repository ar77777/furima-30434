class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(create_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def create_params
    params.require(:item).permit(:name, :category_id, :description, :condition_id, :buyer_burden_id, :prefecture_id, :delivery_time_id, :price, :image).merge(user_id: current_user.id)
  end
end
