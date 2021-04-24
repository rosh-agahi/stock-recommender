class Sector
  # a sector is a category representative of an industry.
  # a way to group stocks from similar industry categories.
  attr_accessor :sec_name, :url, :sec_change, :namelength, :stocks
  @@all =[]

  def initialize(name, url, change)
  # creates new instance of Sector with data passed through from scraper.
    @sec_name = name
    @namelength = name.length.to_i
    @url = url
    @sec_change = change.to_f
    @stocks = []
    save
  end

  def self.all
    @@all
  end

  def self.select(index)
    @@all[index]
  end

  def save
  # saves instance of Sector to array of all sectors @@all
    @@all << self
  end

  def self.showname(index)
    @@all[index].sec_name
  end

  def self.max_length
  # finds the sector with the most characters for space count in display table.
  list = []
  @@all.each do |n|
    list << n.namelength
  end
  list.max.to_i
  end

  def self.display(array_passed = @@all)
  # displays a list of Sectors with index number and percent daily change.
    arr = array_passed
    puts "Sectors:#{" "*(Sector.max_length-5)}% Daily Change"
    puts "---------------------------------------"
    arr.each_with_index do |i,index|
      x = Sector.max_length - i.namelength
        if index <9
          puts " #{index+1}. #{i.sec_name} #{" " * x}     #{i.sec_change}%"
        else
          puts "#{index+1}. #{i.sec_name} #{" " * x}     #{i.sec_change}%"
        end
      end
  end

  def self.sorted
    #sorts the table of segments by greatest daily change to lowest and displays the table
    sorted_list = @@all.sort_by(&:sec_change).reverse
    self.display(sorted_list)
  end

  # def display_top_stocks
  # # if the suggestion to buy or sell a stock is strongly recommended, it will display these stocks only from a particular sector.
  #   stocks.each do |s|
  #     puts "#{s.ticker}, #{s.compname}, #{s.price}"
  #   end
  # end


  # def self.sector_stocks(index, buy_or_sell_list)
  # # calls on the StockScraper to pull all stocks within a sector.
  #   s = @@all[index]
  #
  #   #new stock scraper
  #   StockScraper.new(s.url, s.sec_name)
  #     #feed stocks into an array for this sector
  #
  #   # s.url is the site to scrape
  #   #puts s.display_top_stocks
  # end

  def self.populated?(index)
    s = @@all[index]
    Stock.all.detect{ |stock| stock.sector == s.sec_name } ? (true): (false)
  end

end
