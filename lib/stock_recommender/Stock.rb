class Stock
attr_accessor :ticker, :company, :percent, :action
@@all = []

  def initialize(ticker,company,percent,action)
  @ticker = ticker
  @company = company
  @percent = percent
  @action = action
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
