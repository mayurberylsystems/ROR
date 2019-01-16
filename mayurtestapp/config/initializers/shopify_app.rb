ShopifyApp.configure do |config|
  config.application_name = "Online Test Store"
  config.api_key = "c5d10dc69fba9ff422d85b0d3ecbfab7"
  config.secret = "26ce9c076829503f215c61288e43c164"
  config.scope = "read_orders, read_products" # Consult this page for more scope options:
                                 # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
end
