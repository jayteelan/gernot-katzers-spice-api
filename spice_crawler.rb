require 'json'
require 'nokogiri'
require 'open-uri'

# import data from spice-index.json
spices=File.open('./spice-index.json')
spice_data=JSON.load(spices)

# create a new file to hold an array of objects with data from each spice
all_data=File.new('all_data.json','w')

# create global arrays to accumulate data and track records
hash_data=[]
retrieved_records=[]

spice_data.map{|el|
	# get url from first object in spice_data array and open in Nokogiri
	url=el['url']
	if (retrieved_records.include? url)
		puts "entry already exists"
	else	
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
		hed_arr=page.css('dt b').map{|sect| downcase_kebab(sect.text)}[0..-2]


		# get an array of strings from informational paragraphs
		info_arr=page.css('dd').map{|p| p.text[1..-1].gsub!(/[\n]/," ")}[0..-2]

		# create a hash with hed_arr as keys and info_arr as values and merge into spice_hash
		spice_hash.merge!(hed_arr.zip(info_arr).to_h)

		# shovel spice_hash into hash_data
		hash_data<<spice_hash
		retrieved_records<<url
		puts "#{el['name']} added"
	end
}

# export to JSON
File.open("all_data.json",'w') << JSON.pretty_generate(hash_data)
puts "#{retrieved_records.length} unique records retrieved"