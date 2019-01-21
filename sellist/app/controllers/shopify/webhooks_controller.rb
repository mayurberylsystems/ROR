class Shopify::WebhooksController < Shopify::MainController
  include ShopifyApp::WebhookVerification

  def receive
    params.permit!
    ProductsUpdateJob.perform_later(shop_domain: shop_domain, webhook: webhook_params.to_h)
    render json: {success: "Done"}
  end

  private

  def webhook_params
    params.except(:controller, :action, :type)
  end
end
