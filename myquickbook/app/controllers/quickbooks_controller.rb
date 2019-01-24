class QuickbooksController < ApplicationController
  
  def index 
  end 

  def authenticate
    callback = quickbooks_oauth_callback_url
    token = QB_OAUTH_CONSUMER.get_request_token(:oauth_callback => callback)
    session[:qb_request_token] = token
    redirect_to("https://appcenter.intuit.com/Connect/Begin?oauth_token=#{token.token}") and return
  end

  def oauth_callback
    at = session[:qb_request_token].get_access_token(:oauth_verifier => params[:oauth_verifier])
    token = at.token
    secret = at.secret
    realm_id = params['realmId']
    # store the token, secret & RealmID somewhere for this user, you will need all 3 to work with Quickbooks-Ruby
  end

  def credentials
    expiring_tokens.each do |record|
      access_token = OAuth::AccessToken.new(QB_OAUTH_CONSUMER, record.access_token, record.access_secret)
      service = Quickbooks::Service::AccessToken.new
      service.access_token = access_token
      service.company_id = record.company_id
      new_token = service.renew

      case new_token.error_code
      when "0" # Success
      # Update the stored values
        record.update_attributes!(
        access_token: new_token.token,
        access_secret: new_token.secret,
        token_expires_at: 180.days.from_now.utc,
        )
        puts "Renewal succeeded"
      when "270" # The OAuth access token has expired.
      # Discard any saved credentials, need to restart the OAuth process
        record.update_attributes!(
        access_token: nil,
        access_secret: nil,
        token_expires_at: nil,
        )
        puts "Renewal failed"
      when "212" # Token Refresh Window Out of Bounds
      # Tried to renew it more than 30 days before expiration
        puts "Renewal ignored, tried too soon"
      else
        puts "Renewal failed, code: #{new_token.error_code} message: #{new_token.error_message}"
      end
    end
  end


  def create_customer
    service = Quickbooks::Service::Customer.new
    service.company_id = "123" # also known as RealmID
    service.access_token = access_token # the OAuth Access Token you have from above

    # Equivalent to Quickbooks::Service::Customer.new(:company_id => "123", :access_token => access_token)

    customers = service.query() # Called without args you get the first page of results

    # yields

    customers.entries = ['mayur','rahul','raj']
    customers.start_position = 1 # the current position in the paginated set
    customers.max_results = 20 # the maximum number of results in this query set
  end

  def create_invoice
    invoice = Quickbooks::Model::Invoice.new
    invoice.customer_id = 99
    invoice.txn_date = Date.civil(2013, 11, 20)
    invoice.doc_number = "1001" # my custom Invoice # - can leave blank to have Intuit auto-generate it

    line_item = Quickbooks::Model::InvoiceLineItem.new
    line_item.amount = 50
    line_item.description = "Plush Baby Doll"
    line_item.sales_item! do |detail|
      detail.unit_price = 50
      detail.quantity = 1
      detail.item_id = 500 # Item ID here
    end

    invoice.line_items << line_item

    service = Quickbooks::Service::Invoice.new
    service.company_id = "123"
    service.access_token = access_token
    created_invoice = service.create(invoice)
    puts created_invoice.id

    # make invoice heard copy in public folder

    # File.open("/home/beryl-system/Desktop/mayur/ROR/invoice.pdf", "wb") do |file|
    #   file.write(raw_pdf_data)
    # end
  end

  def destory_sesssion  # Destroy All Session Variable after use
    session[:token] = nil
    session[:secret] = nil
    session[:realm_id] = nil
  end
end