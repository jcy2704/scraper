# rubocop:disable Metrics/MethodLength

require 'nokogiri'
require 'httparty'
require_relative './parser'

# Scrape
class Scraper
  def initialize; end

  def scrape
    newsite = Parser.new
    @items_list = []
    @prices = []
    @page = 1
    while @page <= 2
      url = "https://helmboots.com/collections/shop?page=#{@page}"
      site = newsite.parse_page(url)
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
        @items_list << @item
        @items_list.delete({})
      end
      @page += 1
    end
    @prices.delete(nil)
    @prices = @prices.map { |n| n.gsub('$', '').to_i }
    @prices = @prices.sort.uniq
    @items_list
  end

  def items_count
    @items_list.count
  end

  def by_price(value)
    value = value.to_i
    return 'Invalid Option' unless value <= @prices.max

    @prices = @prices.select { |price| price >= value }
    @prices
  end
end

# rubocop:enable Metrics/MethodLength
