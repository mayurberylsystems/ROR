class Shopify::IntegrationsController < ShopifyApp::AuthenticatedController
  include Shopify::IntegrationsHelper
  layout 'user_home'

  def index
    #@products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    #@webhooks = ShopifyAPI::Webhook.find(:all)
    brand = current_user.brand_detail
    shop_url = shop_session.url
    @token = ShopifyAPI::Base.activate_session(shop_session)
    @shopify_shop = brand.shopify_shops.find_or_create_by(url: shop_url)
    @shopify_shop.update(updated_at: Time.now, name: shop_url.split('.').first)
    @products = ShopifyAPI::Product.find(:all)
    @old_products = @products.select{|p| @shopify_shop.items.find_by(item_number: p.id).present?}
    session[:products] = @products
    params[:step] = 3
    @shopify_shops = brand.shopify_shops
  end

  def sync
    brand = current_user.brand_detail
    @shopify_shop = brand.shopify_shops.find_by(id: params[:shopify_shop_id])
    if params[:commit] == "update"
      unless params[:old_products].blank?
        params[:old_products].each do |product_id|
          save_item(brand, product_id, params[:shopify_shop_id])
        end
        flash[:notice] = "Products updated successfully!"
      end
    else
      unless params[:products].blank?
        debugger
        ShopifyProductsWorker.perform_async(brand.id, params[:shopify_shop_id], params[:products], session[:products].to_json)
        #params[:products].each do |product_id|
          #save_item(brand, product_id, params[:shopify_shop_id])
        #end
        delete_ids = session[:products].map(&:id).map(&:to_s) - params[:products]
        delete_ids.each do |product_id|
          delete_item(brand, product_id, params[:shopify_shop_id])
        end
        flash[:notice] = "Products created successfully!"
      end
    end
    redirect_to brand_items_path
  end

  def delete
    brand = current_user.brand_detail
    @shopify_shop = brand.shopify_shops.find_by(id: params[:shopify_shop_id])
    unless params[:old_products].blank?
      params[:old_products].each do |product_id|
        delete_item(brand, product_id, params[:shopify_shop_id])
      end
      flash[:notice] = "Products deleted successfully!"
    end
    redirect_to brand_items_path
  end
end
