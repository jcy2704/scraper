#!/usr/bin/env ruby

require_relative '../lib/parser'
require_relative '../lib/scraper'

news = CourseSite.new

puts news.scrape
