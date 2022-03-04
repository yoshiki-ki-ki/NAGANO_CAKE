class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end
  
  private
  def item_params
    params.require(:item).permit(:nema, :introduction, :price, :is_active)
  end
end
