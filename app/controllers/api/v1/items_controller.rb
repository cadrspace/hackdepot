module Api
  module V1
    class ItemsController < ApplicationController
      before_action :set_item, only: [:show, :edit, :update, :destroy]

      before_action :authenticate_user!

      respond_to :json

      def index
        @tag = params[:tag]
        @items = Item.order_by(:id => 'desc').page params[:page]
        @items = Item.tagged_with(@tag).page params[:page] if !@tag.nil?
        respond_with @items
      end

      def show
        @qr = RQRCode::QRCode.new( @item.id.to_s, :size => 3, :level => :h )
        respond_with @item, @qr
      end

      private

      def set_item
        @item = Item.find(params[:id])
      end

      def item_params
        params.require(:item)
          .permit(:parent_id, :title, :description, :status, :item_images,
                  :tags, :item_fields, :serial,
                  :item_fields_attributes => [:id, :name, :value])
      end
    end
  end
end
