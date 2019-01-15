ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "79c1fd3a96731957bb9ec8b613c5c4f0"
  config.secret = "ef552d7b4385ceed1ed79d4932d8f7b9"
  config.scope = "read_orders, read_products"
  config.embedded_app = true
end
