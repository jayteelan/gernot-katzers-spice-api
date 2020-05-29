require 'json'
require 'nokogiri'
require 'open-uri'

# import data from spice-index.json
spices=File.open('./spice-index.json')
spice_data=JSON.load(spices)

# get url from first object in spice_data array and open in Nokogiri
url=spice_data[78]['url']
page=Nokogiri::HTML(open(url))

# parse common name from header
common_name=page.css('a[name="top"]').text.split('(')[0]
puts "Common name: #{common_name}"

# parse latin name from header
latin_name=page.css('i[lang="la"]').first.text
puts "Latin name: #{latin_name}"

# part_used=page.css('a[name="part"] p.dd')
# # [1].text[1..-1]
# puts "Part used: #{part_used}"

info_arr=page.css('dd').map{|p| p=p.text[1..-2].to_s.gsub!("\n"," ")}[4..-2]
# .split("\n").filter{|el| el.length>1}
File.open('info_arr.json','w') << JSON.pretty_generate(info_arr)
# {|json| json << JSON.pretty_generate(info_arr)}
# puts JSON.pretty_generate(info_arr)
#.select {|info| info.length>3}