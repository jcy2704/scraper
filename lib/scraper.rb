require 'nokogiri'
require 'httparty'
require_relative './parser'

# Scrapesite
class ScrapeSite
  attr_accessor :url

  def initialize(url)
    @url = url
  end
end

# Scrape
class Scraper < ScrapeSite
  def initialize
    super("https://helmboots.com/collections/shop?page=#{@page}")
  end

  def scrape
    newsite = Parser.new
    @items_list = []
    @prices = []
    @page = 1
    while @page <= 2
      puts "Looking in page #{@page}"
      url = "https://helmboots.com/collections/shop?page=#{@page}"
      site = newsite.parse_page(url)
      puts url
      puts ''
      items = site.css('div.grid-view-item')

      items.each do |listing|
        @item = {
          'product' => listing.css('div.libre').text,
          'price' => listing.css('span.product-price__price').text.split("\n\s\s\s\s\s\s"),
          'sale' => listing.css('span.product-price__sale-label').text,
          'url' => "https://helmboots.com#{listing.css('a')[0].attributes['href'].value}"
        }
        @item['price'].delete("Sale\n\s\s\s\s")
        @item['price'].delete('')
        @item['price'] = @item['price'].pop
        if @item['price'].nil?
          @item.delete('product')
          @item.delete('sale')
          @item.delete('url')
          @item.delete('price')
        end
        @prices << @item['price']
        puts "Added #{@item['product']} #{@item['price']} #{@item['sale']}"
        puts ''
        @items_list << @item
        @items_list.delete({})
      end
      @page += 1
    end
    @items_list
  end

  def items_count
    @items_list.count
  end
end
