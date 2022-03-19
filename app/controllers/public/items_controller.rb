class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    # nameに何かが入っていれば「Genre.find(params[:name])」該当のジャンルを表示させる。
    # nameに何も入っていなければItem.allすべての商品を表示
    @items = params[:name].present? ? Genre.find(params[:name]).items.page(params[:page]) : Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end
end
