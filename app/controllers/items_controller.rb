class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  #def destroy
    # @item = Item.find(params[:id])
    # @item.destroy
  #end

  private

  def item_params
    params.require(:item).permit(:image, :product, :explanation, :category_id, :condition_id, :postage_id, :prefecture_id,
                                 :preparation_days_id, :price).merge(user_id: current_user.id)
  end

  # def set_item
  # @item = Item.find(params[:id])
  # end
end
