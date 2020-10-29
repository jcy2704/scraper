#!/usr/bin/env ruby

require_relative '../lib/parser'
require_relative '../lib/scraper'

put = Scraper.new

system 'clear'
system 'cls'

puts 'Welcome to my scraper! by Steven J. Chung'

sleep 0.5

system 'clear'
system 'cls'

puts 'Please wait for the scraper to finish...'

sleep 0.5

system 'clear'
system 'cls'

put.scrape

puts "We added #{put.items_count} items"
puts ''

puts 'Do you want to see the results? [y\n]'
response = get.chomp

if response.include?['y' || 'yes']
  