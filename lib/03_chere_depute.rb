require 'rubygems'
require 'nokogiri'
require 'open-uri'



name_deputees = []

page = Nokogiri::HTML(URI.open('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))

#def get_names(name_deputees)
    page.css("div.col-container > ul > li > a").each do |node|
   name_deputees.push(node.content)
  end
#end

puts name_deputees

url_deputees = []
#def urls(url_deputees)
page.css("div.col-container > ul > li > a").each do |node|
    url_deputees.push('http://www2.assemblee-nationale.fr' + node['href'])
end
#puts url_deputees
#end

mails_deputees = []
#def mails(mails_deputees)
url_deputees.each do |url|
    page = Nokogiri::HTML(URI.open(url))
    page.css(".deputes-liste-attributs > dd:nth-child(8) > ul:nth-child(1) > li:nth-child(2) > a:nth-child(1)").each do |node|
        mails_deputees.push(node.content)
        puts mails_deputees
    end
end
    
#end

