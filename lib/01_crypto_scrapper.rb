require 'open-uri'
require 'nokogiri'
require 'rubygems'




    page = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))
     crypto_keys = []
     crypto_values = []

    page.css('tr.cmc-table-row  > td:nth-child(5) > a').each do |node|
        crypto_keys.push(node.content)
      end



puts crypto_keys


      page.css('tr.cmc-table-row  > td:nth-child(3) > div').each do |node|
       crypto_values.push(node.content)
      end


      cryptocurrencies_hash = Hash[crypto_keys.zip(crypto_values)]

      cryptocurrencies_hash.each do |key, value|
        puts key + ' : ' + value
      end