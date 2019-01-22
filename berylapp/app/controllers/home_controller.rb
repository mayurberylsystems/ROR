class HomeController < ShopifyApp::AuthenticatedController
  
  def index
  
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @products.each do |x|
      product = Shopproduct.create(shop_id: 1, title: x.title, description: x.body_html, price: x.variants.first.price)
      x.images.each do |y|
      	image = Shopproductimage.create(shopproduct_id: product.id, remote_image_url: y.src)
      end
    end
  end
end
