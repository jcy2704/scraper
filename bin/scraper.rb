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

@pepper.scrape

private

def format_all
  @pepper.items_list.each do |item|
    puts "Product: #{item['product']}"
    puts "Price: #{item['price']}"
    puts "#{item['sale']}: Yes" unless item['sale'] == ''
    sleep 0.1
    puts ''
  end
end

public

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
    handle = @pepper.by_price(value)
    if handle == 'Invalid Option'
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

private

def by_price
  i = 0
  while i <= @pepper.prices.length
    @pepper.items_list.each do |item|
      puts "Product: #{item['product']}\nPrice: #{item['price']}\n\n" if item['price'] == "$#{@pepper.prices[i]}"
      sleep 0.1
    end
    i += 1
  end
end

public

@pepper.items_list.each do |items|
  puts "Added #{items['product']} #{items['price']}"
  sleep 0.2
  puts ''
end

puts ''
puts ''
puts "We added #{@pepper.items_count} items"
puts ''
puts ''

menu

# rubocop:enable Metrics/MethodLength
