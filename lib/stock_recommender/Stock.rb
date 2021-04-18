class Stock
 attr_accessor :ticker, :company, :price, :percentchange, :reco, :sector
 @@all = []
 
  def initialize(ticker)
    @ticker = ticker
    @company = company
    @price = price
    @percentchange = percentchange
    @reco = reco
    @sector = sector
    save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  # def list
  #   puts "Ticker // Company // price // %Change // Recommendation"
  #    all.each do |stock|
  #      if stock.sector
  #   end
  # end

end
