class Shopify::ProductsController < Shopify::MainController

  def update_list
    unless params[:id].blank?
      brand = current_user.brand_detail
      @shopify_shop = brand.shopify_shops.find_by(id: params[:id])
      shop = Shop.find_by_shopify_domain(@shopify_shop.url)
      unless shop.blank?
        session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
        ShopifyAPI::Base.activate_session(session)
        begin
          @products = ShopifyAPI::Product.find(:all)
          @old_products = @products.select{|p| @shopify_shop.items.find_by(item_number: p.id).present?}
        rescue Exception => ex
          puts ex
        end
      else
        flash[:error] = "Invalid Shop ID"
      end
    else
      flash[:error] = "Please provide shopify domain ID"
    end
  end
end
