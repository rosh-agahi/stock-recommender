require 'nokogiri'
require 'open-uri'

class StockScraper
  attr_accessor :site, :doc, :stockrows, :sector

  def initialize(site, sectorname)
    @site = site
    @doc = Nokogiri::HTML(open(site))
    @stockrows = doc.css("tbody").css("tr")

    @stockrows.each do |stock|
      n=3 #this is used to cut the company name to the first three words available in the description in the span element.
      ticker = stock.css("td").css("a")[0].text
      company = stock.css("td").css("span.tv-screener__description").text.upcase.strip.gsub(/[^A-Z ]/, '').split(/\s+/, n+1)[0...n].join(' ')
      price = stock.css("td")[1].text
      percentchange = stock.css("td")[2].text
      reco = stock.css("td")[4].text
      sector = sectorname
      Stock.new(ticker, company, price, percentchange, reco, sector)
    end

   end

 end
