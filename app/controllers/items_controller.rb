class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :edit
  before_action :set_item, only: [:show, :edit, :update, :identification, :destroy]
  before_action :identification, only: :edit

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
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
      redirect_to item_path(item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :category_id, :description, :condition_id, :buyer_burden_id, :prefecture_id, :delivery_time_id, :price, :image).merge(user_id: current_user.id)
  end

  def identification
    if @item.user.id != current_user.id
      redirect_to root_path
    end
  end
end