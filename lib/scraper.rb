require 'nokogiri'
require 'httparty'
require_relative './parser'

# site
class ScrapeSite
  attr_accessor :url

  def initialize(url)
    @url = url
  end
end

# course Site
class CourseSite < ScrapeSite
  def initialize
    super('https://www.coursera.org/courses')
  end

  def scrape
    newsite = Parser.new
    site = newsite.parse_page(@url)
    courses_list = []
    courses = site.css('li.ais-InfiniteHits-item')

    courses.each do |listing|
      course = {
        title: listing.css('h2.card-title').text,
        partner: listing.css('span.partner-name').text,
        type: listing.css('div.product-type-row').text,
        level: listing.css('span.difficulty').text,
        url: "https://www.coursera.org#{courses.css('a')[0].attributes['href'].value}"
      }
      courses_list << course
    end
    courses_list
  end
end
