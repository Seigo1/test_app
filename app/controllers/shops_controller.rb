class ShopsController < ApplicationController
    
    def new
        @shop = Shop.new
    end

    def create
        @shop = Shop.new(shop_params)
        @shop.user_id = current_user.id
        if @shop.save
          redirect_to shops_path
        else
          render :new
        end
    end

    def index
        @shops = Shop.page(params[:page]).reverse_order
    end
    
    def show
        @shop = Shop.find(params[:id])
        @comment = Comment.new
    end
    
    def destroy
        @shop = Shop.find(params[:id])
        @shop.destroy
        redirect_to shops_path
    end
    
    # 投稿データのストロングパラメータ
    private
    
    def shop_params
        params.require(:shop).permit(:shop_name, :image, :caption)
    end
    
end
