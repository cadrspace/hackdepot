require 'rqrcode'

class ItemsController < ApplicationController
  
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index]
  respond_to :html

  def index
    @tag = params[:tag]
    @items = Item.order_by(:id => 'desc').page params[:page]
    @items = Item.tagged_with(@tag).page params[:page] if !@tag.nil?
    @items = Item.search(params[:query]).page params[:page] if !params[:query].nil?
    respond_with(@items)
  end

  def search
    @items = Item.search(params[:query])
    puts @items
    respond_to do |format|
      format.json { render :json => @items }
    end
  end

  def action
    print params
    @items = Item.find(params[:items].keys)
    if (params[:dowhat] == 'print')
      render 'items/print.html.slim', :layout => false
    end
  end

  def show
    @qr = RQRCode::QRCode.new( @item.id.to_s, :size => 3, :level => :h )
    respond_with(@item, @qr)
  end

  def new
    @item = Item.new
    @item.item_fields.build
    @item.item_fields.build
    respond_with(@item)
  end

  def edit
    @item.item_fields.build
  end

  def create
    puts item_params
    @item = Item.new(item_params)
    @item.user_id = current_user.id
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

  def remove_image
    item = Item.find(params[:id])
    attachment_delete! item, params[:image_id]
    respond_to do |format|
      format.json { head :ok }
    end
  end

  def images_flush
    @item.item_images.destroy_all
  end

  private

  # Delete an attachment with ID from an ITEM.  Return value is
  # undefined.
  def attachment_delete!(item, id)
    bson_id = BSON::ObjectId(id)
    attachments = item.item_images.select {|i| i.id == bson_id}
    attachments[0].destroy
    item.save!
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item)
      .permit(:parent_id, :title, :description, :status, :item_images, :tags, :item_fields, :serial,
              :item_fields_attributes => [:id, :name, :value])
  end
end
