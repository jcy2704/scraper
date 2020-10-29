#!/usr/bin/env ruby

require_relative '../lib/parser'
require_relative '../lib/scraper'

peppermint = Scraper.new

system 'clear'
system 'cls'

puts 'Welcome to my scraper! by Steven J. Chung'

sleep 2

puts 'Please wait for the scraper to finish...'

sleep 2

peppermint.scrape

puts ''
puts ''
puts "We added #{put.items_count} items"
puts ''
puts ''

peppermint.menu
