require 'nokogiri'
require 'open-uri'

class SectorScraper
  attr_accessor :site, :doc, :sector

  def initialize
    @site = "https://www.tradingview.com/markets/stocks-usa/sectorandindustry-sector/"
    @doc = Nokogiri::HTML(open(site))
    @sector = doc.css("div#js-screener-container").css("tbody").css("tr")

    sector.each do |s|
    pchange = s.css("td")[3].text
    name = s.css("a").text
    url = "https://www.tradingview.com"+ s.css("a")[0].attributes["href"].value
    stock_count = s.css("td")[6].text
    Sector.new(name, url, pchange, stock_count)
    end
  end
end
