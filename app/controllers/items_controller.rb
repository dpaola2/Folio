class ItemsController < ApplicationController
  def index
    @items = Item.order(:created_at).all
  end

  def new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to items_path
    else
      raise "error"
      redirect_to new_item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:url)
  end
end
