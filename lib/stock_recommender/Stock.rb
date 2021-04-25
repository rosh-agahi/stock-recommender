class Stock
 attr_accessor :ticker, :company, :price, :percentchange, :namelength, :reco, :sector
 @@all = []

  def initialize(ticker, company, price, percentchange, reco, sector)
    @ticker = ticker
    @company = company
    @price = price
    @percentchange = percentchange
    @reco = reco
    @sector = sector
    @namelength = company.length
    save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def Stock.maxcomplength
    # finds the stock with the most characters for space count in display table.
    list = []
    @@all.each do |n|
      list << n.namelength
    end
    list.max.to_i
  end

  def self.list(sectorname,rec)
    recommended = rec
    puts "\n"
    case rec
    when 's'
      recommended = "Strong Sell"
      puts "Showing 'Strong Sell' recommendations for #{sectorname}:"
    else
      recommended = "Strong Buy"
      puts "Showing 'Strong Buy' recommendations for #{sectorname}:"
    end
    puts "\n"

    sleep 1
    puts "Ticker  Company#{" "*(Stock.maxcomplength - 5)}    Price     % Change"
    puts "-" * (Stock.maxcomplength + 35)

    #x = spaces
    for t in @@all do
      #using t as in ticker to represent individual stocks
      if (t.sector == sectorname) && (t.reco == recommended)
        a = t.ticker
        b = t.company
        c = t.price
        d = t.percentchange
        x = t.ticker.length
        y = t.company.length
        z = t.price.length
        q = Stock.maxcomplength
        puts a + " " * (8-x) + b + " " * (q-y) + " "* (10-z) +"$" + c + "     " +d
      else
        next
      end
    end
  end

end
