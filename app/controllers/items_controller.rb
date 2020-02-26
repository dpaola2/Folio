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
      flash[:error] = "An error occurred."
      turbolinks_redirect(new_item_path, action: "replace")
    end
  end

  def show
    find_item
  end

  def parse
    find_item(:item_id)
    @item.parse!
    turbolinks_redirect(item_path(@item), action: "replace")
  end

  private

  def item_params
    params.require(:item).permit(:url)
  end

  def find_item(key=:id)
    @item = Item.find(params[key])
  end
end
