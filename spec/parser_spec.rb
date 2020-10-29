require 'nokogiri'
require_relative '../lib/parser'
require_relative './spec_helper.rb'

describe Parser do
  let(:mock_url) { 'https://example.com/' }
  let(:mock_response) { instance_double(HTTParty::Response, body: mock_response_body) }
  let(:mock_response_body) { 'response_body' }
  let(:parser) { Parser.new }

  describe '#parse_page' do
    it 'return parsed HTML from unparsed page by httparty' do
      allow(HTTParty).to receive(:get).and_return(mock_response)
      parsed_element = parser.parse_page(mock_url)
      expect(parsed_element.to_html).to eql(mock_response_body)
    end
  end
end
