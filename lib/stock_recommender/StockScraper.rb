require 'nokogiri'
require 'open-uri'

class SectorScraper
  attr_accessor :site, :doc, :sector

  def initialize(site, sectorname)
    @site = site
    @doc = Nokogiri::HTML(open(site))
    @stockrows = doc.css("tbody").css("tr")

    stockrows.each do |stock|
      n=2 #this is used to cut the company name to the first two words available in the description in the span element.
      ticker = stock.css("td").css("a")[0].text
      company = stock.css("td").css("span.tv-screener__description").text.strip.split(/\s+/, n+1)[0...n].join(' ')
      price = stock.css("td")[1].text
      percentchange = stock.css("td")[2].text
      reco = stock.css("td")[4].text
      sector = sectorname
      Stock.new(ticker, company, price, percentchange, reco, sector)
    end
   end

 end




   def initialize
     @site = "https://www.tradingview.com/markets/stocks-usa/sectorandindustry-sector/"
     @doc = Nokogiri::HTML(open(site))
     @sector = doc.css("div#js-screener-container").css("tbody").css("tr")

     sector.each do |s|
     pchange = s.css("td")[3].text
     name = s.css("a").text
     url = "https://www.tradingview.com"+ s.css("a")[0].attributes["href"].value
     Sector.new(name, url, pchange)
     end
   end
 end
