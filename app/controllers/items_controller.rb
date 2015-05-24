class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @items = Item.all
    respond_with(@items)
  end

  def show
    respond_with(@item)
  end

  def new
    @item = Item.new
    respond_with(@item)
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      if params[:item_images]
        params[:item_images]['image'].each do |a|
          @item_image = @item.item_images.create!(:image => a)
        end
      end
    end
    respond_with(@item)
  end

  def update       
    if @item.update(item_params)
      if params[:item_images]
        params[:item_images]['image'].each do |a|
          @item_image = @item.item_images.create!(:image => a)
        end
      end
    end

    respond_with(@item)
  end

  def destroy
    @item.destroy
    respond_with(@item)
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
  
  def item_params
    params.require(:item).permit(:title, :description, :status, :item_images)
  end
end
