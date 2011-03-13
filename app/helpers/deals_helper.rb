module DealsHelper
  
  def buy_deal_path(deal)
    "/buy/#{deal.id}" 
  end
  
end
