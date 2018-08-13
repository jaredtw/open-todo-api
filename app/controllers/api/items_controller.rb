class Api::ItemsController < ApiController
  before_action :authenticated?

  def create
    item = current_user.lists.find(params[:list_id]).items.build(item_params)
    if item.save
      render json: item
    else
      render json: { errors: item.errors.full_messages },
      status: :unprocessable_entity
    end
  end

  def update
    @item = Item.find(params[:id])
    raise unless @item.list.user == current_user
    if @item.update(item_params)
      render json: @item
    else
      render json: { errors: @item.errors.full_messages },
      status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :status)
  end
end
