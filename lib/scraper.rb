# rubocop:disable Metrics/MethodLength, Metrics/AbcSize

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

  def format_all
    @items_list.each do |item|
      puts "Product: #{item['product']}"
      puts "Price: #{item['price']}"
      puts "#{item['sale']}: Yes" unless item['sale'] == ''
      puts ''
    end
  end

  def sort_prices
    @prices.delete(nil)
    @prices = @prices.map { |n| n.gsub('$', '').to_i }
    @prices = @prices.sort.uniq
    @prices
  end

  def by_price(value)
    value = value.to_i
    sort_prices
    @prices = @prices.select { |price| price >= value }
    # @item['price'] = @item['price'].gsub('$', '').to_i
    i = 0
    while i <= @prices.length
      @items_list.each do |item|
        puts "Product: #{item['product']}\nPrice: #{item['price']}\n\n" if item['price'] == "$#{@prices[i]}"
        puts "#{item['sale']}: Yes" unless item['sale'] == ''
      end
      i += 1
    end
  end

  def menu
    puts "1. Show All Products\n2. Products By Price\n3. Exit"
    puts ''
    puts 'What would you like to do?'
    response = gets.chomp

    if response.include?('1')
      system 'clear'
      system 'cls'
      format_all
      menu
    elsif response.include?('2')
      system 'clear'
      system 'cls'
      puts 'Please input your minimum price.'
      value = gets.chomp
      by_price(value)
      menu
    elsif response.include?('3')
      puts 'Have a nice day! :D'
      exit
    end
  end
end

# rubocop:enable Metrics/MethodLength, Metrics/AbcSize
