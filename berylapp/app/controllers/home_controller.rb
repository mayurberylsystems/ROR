class HomeController < ShopifyApp::AuthenticatedController
  
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @products.each do |x|
      product = Shopifyproduct.create(title: x.title, description: x.body_html, price: x.variants.first.price)
      image = Picture.create(product_id: product.id, remote_correspondingimage_url: x.images.first.src)
    end
  end

  # def productsync
  # 	@products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
  #   @products.each do |x|
  #     product = Product.create(title: x.title, description: x.body_html, price: x.variants.first.price)
  #     image = Productimg.create(product_id: product.id, image: x.images.first)
  #   end	
  # end

end




# http://railscasts.com/episodes/253-carrierwave-file-uploads
    # i = Picture.new
    #   i.correspondingimage = params[:file]
    #   i.save