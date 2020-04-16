require 'open-uri'
require 'nokogiri'
require 'rubygems'


page = Nokogiri::HTML(open("index.html"))   
puts page.class   # => Nokogiri::HTML::Document
