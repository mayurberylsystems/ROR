class HomeController < ShopifyApp::AuthenticatedController
  
  def index
  
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @products.each do |x|
      product = Shopproduct.create(shop_id: 1, title: x.title, description: x.body_html, price: x.variants.first.price)
      image = Shop.first.shopproducts.first.shopproductimages.create(remote_image_url: x.images.first.src)
    end
  end
end
