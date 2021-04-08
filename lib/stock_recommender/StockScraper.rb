require 'nokogiri'
require 'open-uri'

class StockScraper
  attr_accessor :site, :doc, :stock

  def initialize(site)
    @site = site
     @doc = Nokogiri::HTML(open(site))
   end

 end
