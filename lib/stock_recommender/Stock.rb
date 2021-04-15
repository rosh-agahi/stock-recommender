class Stock
attr_accessor :ticker, :company, :percent, :action
@@all = []

  def initialize(ticker,percent,action)
  @ticker = ticker
  @percent = percent
  @rating = rating
  @@all << self
  end

  def all
  @@all
  end

  def list
     all.each do |s|
    end
  end
end
