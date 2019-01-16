class HomeController < ShopifyApp::AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
  	
  end

  def productsync

  	@products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
  	@products.each do |x|
  		@details = Product.create(title: x.title, description: x.body_html)
  	end
  end

end