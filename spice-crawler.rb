require 'json'
require 'nokogiri'
require 'open-uri'

# import data from spice-index.json
spices=File.open('./spice-index.json')
spice_data=JSON.load(spices)

# get url from first object in spice_data array and open in Nokogiri
url=spice_data[78]['url']
page=Nokogiri::HTML(open(url))

common_name=page.css('a[name="top"]').text.split('(')[0]
puts "Common name: #{common_name}"

latin_name=page.css('i[lang="la"]').first.text
puts "Latin name: #{latin_name}"

part_used=page.css('a[name="part"] p.dd')
# [1].text[1..-1]
puts "Part used: #{part_used}"