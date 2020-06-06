require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'

# target URL
url='http://gernot-katzers-spice-pages.com/engl/spice_small.html'

# parse page source to Nokogiri object
parse_page=Nokogiri::HTML(open(url))

# empty results array
spice_array=[]

# get anchor tags/links where class='idxlist'
links=parse_page.css('div.idxlist a')

# push each link's inner HTML (minus first space character) and href to spice_array
links.map{|link| spice_array.push({name:link.text[1..-1], url:"http://gernot-katzers-spice-pages.com/engl/#{link['href']}"})}

# create a new spice-index.json file
File.new('spice-index.json','w')

# export spice_array as JSON to spice-index.json
File.open('spice-index.json', 'w'){|json| json << JSON.pretty_generate(spice_array)}