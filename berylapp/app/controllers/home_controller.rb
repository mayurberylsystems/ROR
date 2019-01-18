class HomeController < ShopifyApp::AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @products.each do |x|
      @details = Storeproduct.create(title: x.title, description: x.body_html, productimage: x.images.first)
    end
  end

  def productsync
  	@products = ShopifyAPI::Product.find(:all, params: { limit: 10 })	
  end

end