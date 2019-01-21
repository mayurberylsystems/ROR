class Seller::MarketplaceController < Seller::MainController
  autocomplete :brand_detail, :company_name

  def index
    #@items = Item.enabled.paginate(page: params[:page], per_page: 10)
    session[:catg_id] = ''
    session[:sub_catg_id] = ''
    session[:prod_catg_id] = ''
    search = Item.filter(params, session)
    @items = search.results
  end

  def item_details
    @item = Item.find(params[:id])
    @attributes = Item.column_names - ['id', 'brand_detail_id', 'category_id', 'sub_category_id', 'product_category_id', 'created_at', 'updated_at', 'enabled_for_sale', 'discount_in_percent', 'discount_in_currency', 'commission_in_percent', 'commission_in_currency']
    @show_link = (!(current_user.seller_items.where("discontinued = ?", false).map(&:item_id).include? @item.id) and params[:home].blank?)
  end

  def add_to_store
    @item = Item.find(params[:id])
    current_user.seller_items.create(item_id: @item.id)
    flash[:notice] = "Item added to store successfully!"
  end

  def catg_items
    if !params[:prod_catg_id].blank?
      session[:catg_id] = ''
      session[:sub_catg_id] = ''
      session[:prod_catg_id] = ProductCategory.friendly.find(params[:prod_catg_id]).id
    elsif !params[:sub_catg_id].blank?
      session[:catg_id] = ''
      session[:sub_catg_id] = Category.friendly.find(params[:sub_catg_id]).id
      session[:prod_catg_id] = ''
    else
      session[:catg_id] = Category.friendly.find(params[:catg_id]).id
      session[:sub_catg_id] = ''
      session[:prod_catg_id] = ''
    end
    search = Item.filter(params, session)
    @items = search.results
  end

  def search
    search = Item.filter(params, session)
    @items = search.results
  end

  def typehead_search
    search = Item.filter(params, session)
    #search = Item.search { fulltext "*#{params[:search_term]}*" }
    items = search.results
    new_items = items.map(&:attributes)
    new_items.each_with_index do |item,index|
      item['brand'] = items[index].brand_detail.company_name
    end
    render json: new_items
  end

  def item
    @items = Item.where("id = ?", params[:id]).paginate(page: params[:page], per_page: 10)
  end

  def search_brands
    search = BrandDetail.search do
      fulltext params[:term]
    end
    @brands = search.results
  end
end
