class ItemsController < ApplicationController
  def index
    @items = Item.order(:created_at).all
  end

  def new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      turbolinks_redirect(items_path, action: "restore")
    else
      raise "error"
      turbolinks_redirect(new_item_path, action: "replace")
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:url)
  end
end
