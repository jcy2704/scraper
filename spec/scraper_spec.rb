require 'nokogiri'
require_relative '../lib/scraper_class'
require_relative './spec_helper.rb'

describe Scraper do
  let(:mock_scraper) { Scraper.new }

  describe '#scrape' do
    it 'return array with the info' do
      expect(mock_scraper.scrape).to be_an Array
    end
  end

  describe '#items_count' do
    it 'return the total of items in the array' do
      mock_scraper.scrape
      expect(mock_scraper.items_count).to eq(50)
    end
  end

  describe '#by_price' do
    it 'return array of prices' do
      mock_scraper.scrape
      expect(mock_scraper.by_price(0)).to be_an Array
    end

    it 'return price in array' do
      mock_scraper.scrape
      expect((mock_scraper.by_price(249))[0]).to eq(249)
    end
  end
end
