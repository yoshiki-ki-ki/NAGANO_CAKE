class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    # nameに何かが入っていれば「Genre.find(params[:name]).items.all」該当のジャンルを表示させる。
    # nameに何も入っていなければItem.allすべての商品を表示
    @items = params[:name].present? ? Genre.find(params[:name]).items.page(params[:page]) : Item.page(params[:page])
    @item_all = params[:name].present? ? Genre.find(params[:name]).items.all : Item.all
    @genre_name = params[:name].present? ?  Genre.find(params[:name]).name : "商品"
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end
end
