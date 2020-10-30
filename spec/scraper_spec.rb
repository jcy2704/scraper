require_relative '../lib/scraper_class'

describe Scraper do
  let(:mock_scraper) { Scraper.new }

  describe '#scrape' do
    it 'return array with the info' do
      expect(mock_scraper.scrape).to be_an Array
    end
  end

  describe '#format_price' do
    it 'raise error for private methods' do
      expect{mock_scraper.format_price}.to raise_error(NoMethodError, /private method/)
    end
  end

  describe '#delete_useless' do
    it 'raise error for private methods' do
      expect{mock_scraper.delete_useless}.to raise_error(NoMethodError, /private method/)
    end
  end

  describe '#prices_list' do
    it 'raise error for private methods' do
      expect{mock_scraper.prices_list}.to raise_error(NoMethodError, /private method/)
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
