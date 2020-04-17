require 'rubygems'
require 'nokogiri'
require 'open-uri'



town_name = []
townhall_email = []
town_url = []

page = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))

#def get_town_name
    
    page.css('a.lientxt').each do |node|
        town_name.push(node.content)
    end
    puts town_name
#end

#def get_townhall_url
    page.css('a.lientxt').each do |node|
        town_url.push('http://annuaire-des-mairies.com/' + node['href'])
    end
    #puts town_url
#end


#def get_townhall_email(town_url)
   town_url.each do |url|
     page = Nokogiri::HTML(URI.open(url))
    
    page.css('table.table:nth-child(1) > tbody:nth-child(3) > tr:nth-child(4) > td:nth-child(2)').each do |node|
       townhall_email.push(node.content) 
    end
end

  puts townhall_email
#end

email_by_townhall = HASH[town_name.zip(townhall_email)]
email_by_townhall.each do |town_name, townhall_email|
    puts town_name + ':' + townhall_email
end