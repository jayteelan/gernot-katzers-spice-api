require 'json'
require 'nokogiri'
require 'open-uri'

# import data from spice-index.json
spices=File.open('./spice-index.json')
spice_data=JSON.load(spices)

# get url from first object in spice_data array and open in Nokogiri
url=spice_data[89]['url']
page=Nokogiri::HTML(open(url))

# parse common name from header
common_name=page.css('a[name="top"]').text.split('(')[0][0..-2]

# parse latin name from header
latin_name=page.css('i[lang="la"]').first.text

# create a hash with common and latin names
spice_hash={:"common-name"=>common_name,:"latin-name"=>latin_name}

# reformat text casing
def downcase_kebab(label)
	label.split(/[\s \u00a0]/).length==1?
		label.downcase : label.downcase.gsub!(/[\s \u00a0]/, "-")
	#  label.downcase.gsub!(/[\s \u00a0]/, "-")
end

# get an array of strings from section headings
section_arr=page.css('dt b').map{|sect| downcase_kebab(sect.text)}[0..-2]

# section_arr.map{|sect| sect}

# get an array of strings from informational paragraphs
info_arr=page.css('dd').map{|p| p.text[1..-1].gsub!(/[\n]/," ")}[0..-2]

# create a hash with section_arr as keys and info_arr as values
spice_hash.merge!(section_arr.zip(info_arr).to_h)

# export to JSON
File.open("#{downcase_kebab(spice_hash[:'common-name'])}-info_arr.json",'w') << JSON.pretty_generate(spice_hash)