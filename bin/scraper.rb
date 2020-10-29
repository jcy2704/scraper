#!/usr/bin/env ruby

# rubocop:disable Metrics/MethodLength

require_relative '../lib/parser'
require_relative '../lib/scraper_class'

@pepper = Scraper.new

system 'clear'
system 'cls'

puts 'Welcome to my scraper! by Steven J. Chung'

sleep 2

puts 'Please wait for the scraper to finish...'

@peppermint = @pepper.scrape

def format_all
  @peppermint.each do |item|
    puts "Product: #{item['product']}"
    puts "Price: #{item['price']}"
    puts "#{item['sale']}: Yes" unless item['sale'] == ''
    puts ''
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
    @handle = @pepper.by_price(value)
    if @handle == 'Invalid Option'
      puts ''
      puts "Sorry we dont't have items with such price :C"
      puts ''
      puts 'Try input a lower number.'
      puts ''
    else
      by_price
    end
    menu
  elsif response.include?('3')
    puts ''
    puts 'Have a nice day! :D'
    exit
  end
end

def by_price
  i = 0
  while i <= @handle.length
    @peppermint.each do |item|
      puts "Product: #{item['product']}\nPrice: #{item['price']}\n\n" if item['price'] == "$#{@handle[i]}"
    end
    i += 1
  end
end

@peppermint.each do |items|
  puts "Added #{items['product']} #{items['price']}"
  puts ''
end

puts ''
puts ''
puts "We added #{@pepper.items_count} items"
puts ''
puts ''

menu

# rubocop:enable Metrics/MethodLength
