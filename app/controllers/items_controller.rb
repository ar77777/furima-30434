class ItemsController < ApplicationController
  before_action :identification, only: :edit
  before_action :login_confirmation, only: :edit

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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to item_path(item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :category_id, :description, :condition_id, :buyer_burden_id, :prefecture_id, :delivery_time_id, :price, :image).merge(user_id: current_user.id)
  end

  def identification
    item = Item.find(params[:id])
    redirect_to action: :index unless item.user.id == current_user.id
  end

  def login_confirmation
    item = Item.find(params[:id])
    redirect_to action: :index unless user_signed_in?
  end
end
