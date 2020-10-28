# rubocop:disable Style/RedundantAssignment

require 'nokogiri'
require 'httparty'

# Parser
class Parser
  def parse_page(url)
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML.fragment(unparsed_page.body)
    parsed_page
  end
end

# rubocop:enable Style/RedundantAssignment
