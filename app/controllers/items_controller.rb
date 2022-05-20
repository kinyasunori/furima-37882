class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    #@items = Item.all.includes(:user)
  end

  def new
    #@item = Item.new
  end

  def create
    #@item = Item.new(item_params)
    #if @item.save
      #redirect_to root_path(@item)
    #else
      #render :new
      #@item = Item.includes(:user)
    #end
  end

  def destroy
    #@item = Item.find(params[:id])
    #@item.destroy
  end

  private

  #def item_params
    #params.require(:item).permit(:nickname, :family_name, :first_name, :read_family, :read_first,
                                 #:birth).merge(user_id: current_user.id)
  #end
end
