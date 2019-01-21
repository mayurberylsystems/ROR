ShopifyApp.configure do |config|
  config.application_name = APP_CONFIG['shopify_app_name']
  config.api_key = APP_CONFIG['shopify_app_key']
  config.secret = APP_CONFIG['shopify_app_secret']
  config.scope = "read_orders, read_products, write_products"
  config.embedded_app = true
  config.after_authenticate_job = false
  #config.session_repository = ShopifyApp::InMemorySessionStore
  config.session_repository = Shop
  config.root_url = '/shopify'
end

ShopifyApp.configure do |config|
  config.webhooks = [
    {topic: 'products/update', address: 'http://sellist.io/shopify/webhooks/products_update', format: 'json'},
    {topic: 'carts/update', address: 'http://sellist.io/shopify/webhooks/carts_update'},
    {topic: 'products/create', address: 'http://sellist.io/shopify/webhooks/products_create'},
    {topic: 'products/add', address: 'http://sellist.io/shopify/webhooks/products_add'}
  ]
end
