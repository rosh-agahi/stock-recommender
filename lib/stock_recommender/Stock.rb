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

  def self.list(sectorname,qualify)
    recommended = qualify
    puts recommended
    puts "Ticker // Company // price // %Change"

    case qualify
    when 's'
      recommended = "Strong Sell"
    else
      recommended = "Strong Buy"
    end
    puts recommended
    for stock in @@all do
      if (stock.sector == sectorname) && (stock.reco == recommended)
        puts "#{stock.ticker}"
        puts "#{stock.company}"
        puts "#{stock.price}"
        puts "#{stock.percentchange}"
        puts stock.reco
        puts stock.sector
        puts "\n"
      else
        next
      end
    end
  end

end
