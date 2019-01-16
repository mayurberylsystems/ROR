ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "88ad2d76d1b3ac5f6778429e4aa5bbd8"
  config.secret = "947566348ea44445df59f7580ee312f6"
  config.scope = "shop products" # Consult this page for more scope options:
                                 # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
end
