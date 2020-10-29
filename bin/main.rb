#!/usr/bin/env ruby

require_relative '../lib/parser'
require_relative '../lib/scraper'

put = Scraper.new

put.scrape
