class Shop
  attr_reader :name

  def initialize(shop)
    @name = shop[:name]
  end

  def self.find_a_shop(location)
    shop_list = GoogleBikeShopService.shop_query(location)
    shop_list.map do |shop|
      Shop.new(shop)
    end
  end

end
