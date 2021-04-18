class Stock
 attr_accessor :ticker, :company, :price, :percentchange, :reco, :sector
 @@all = []

  def initialize(ticker, company, price, percentchange, reco, sector)
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

  def self.list(sectorname)
    puts "Ticker // Company // price // %Change // Recommendation"

    for stock in @@all do
      if stock.sector == sectorname
        puts stock.ticker
      else
        next
      end
    end
  end

end
