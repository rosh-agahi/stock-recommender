class Sector
  # a sector is a category representative of an industry.
  # a way to group stocks from similar industry categories.
  attr_accessor :sec_name, :url, :sec_change, :namelength, :stocks, :indexnum, :stock_count
  @@all =[]

  def initialize(name, url, change, stock_count)
  # creates new instance of Sector with data passed through from scraper.
    @sec_name = name
    @namelength = name.length.to_i
    @url = url
    @stock_count = stock_count.to_i
    @sec_change = change.to_f
    @stocks = []
    @indexnum = 0
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
    self.indexnum = @@all.length + 1
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
    puts "\n"
    puts "Sectors:#{" "*(Sector.max_length-5)}% Daily Change".yellow
    puts "---------------------------------------".yellow
    arr.each do |i|
      x = Sector.max_length - i.namelength
        if i.indexnum <10
          puts " #{i.indexnum}. #{i.sec_name} #{" " * x}     #{i.sec_change}%"
        else
          puts "#{i.indexnum}. #{i.sec_name} #{" " * x}     #{i.sec_change}%"
        end
      end
  end

  def self.sorted
    #sorts the table of segments by greatest daily change to lowest and displays the table
    sorted_list = @@all.sort_by(&:sec_change).reverse
    self.display(sorted_list)
  end

  def self.populated?(index)
    s = @@all[index]
    Stock.all.detect{ |stock| stock.sector == s.sec_name } ? (true): (false)
  end

end
