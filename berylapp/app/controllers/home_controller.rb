class HomeController < ShopifyApp::AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @products.each do |x|
      @details = Test.create(title: x.title, description: x.body_html, price: x.variants.first.price)
    end
  end

  def productsync
  	@products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
  	
  end

end