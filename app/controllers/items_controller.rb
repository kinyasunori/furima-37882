class ItemsController < ApplicationController
  def index
    @items = item.all.includes(:user)
  end
end
