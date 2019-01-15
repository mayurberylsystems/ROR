ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "6f467b0cf47130f6cc318cca8bca9009"
  config.secret = "ad8a8f4b93e2eb607dae646dbee8b466"
  config.scope = "read_orders, read_products"
  config.embedded_app = true
end
