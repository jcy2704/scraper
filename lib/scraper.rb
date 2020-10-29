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
    super('https://en.wikipedia.org/wiki/List_of_international_schools')
  end

  def scrape
    newsite = Parser.new
    site = newsite.parse_page(@url)
    @items_list = []
    items = site.css('div.schools_per_country')

    items.each do |listing|
      @item = {
        'country' => listing.css('span.mw-headline').text,
        'name' => listing.css('li.school').text.split("\n"),
        'url' => "https://en.wikipedia.org#{listing.css('a')[0].attributes['href'].value}"
      }
      @item['name'].delete('')
      puts "Added #{@item['country']} #{@item['name']}"
      puts ''
      @items_list << @item
    end
    @items_list
  end

  def by_country(input = nil)
    puts "These are the schools from #{@items_list}"
  end
end
