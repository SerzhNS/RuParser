#!/usr/bin/ruby
#encoding utf-8

# Task 02. Parse text file. Determine part of speech, single or plural, declension of the noun.
# Print a full sentence if there are one more variant of the noun.

require_relative "word"
require_relative "morph_01"

include Morph

all_snt = []
rep_words = {}
new_rep_words = {}
h_f = {}
base_words = {}

puts "====================================================================" # temp
# ------ open input and output files --------------------
in_file = File.new("/home/ssn/RoR_02/Anna_Karenina.txt") 
o_f = File.new("/home/ssn/RoR_02/step_4/out_01.txt", "w")
arr_lines = in_file.readlines
arr_lines.each { |l| l.chomp! }

# ------ collect all sentences --------------------------
total_string = arr_lines.join
all_snt = total_string.split(/[.!?…]/)
all_snt.each { |s| s.lstrip! } #; o_f.puts s }

# ------ clean up all words and calculate their friquancy ---
j_snt = 0
all_snt.each { |l| 
	line = Word.new(l)
	line.gsub!(/[.,:"'|„“«»—0123456789*?;…!(){}\[\]]/,' ')
	arr_tmp = line.split
	arr_tmp.each { |w| w.downcase!
		if rep_words.include?(w)
			rep_words[w][:q] += 1
			rep_words[w][:s] << j_snt
		else
			rep_words[w] = {:q => 1, :s => [j_snt]}
		end
	 }
		j_snt += 1
  }

# ----- sort all words in alfabet order ------------------
new_rep_words = rep_words.sort { |a,b| a<=>b }	#.to_h

h_f["весн"] = {:bs => ["весн", ["весн", "весен"]], :tpl => "сущ ru f ina 1*d", :end => {:s => ["а","ы","е","у","ой","ою","е"], :pl => [["ы","","ам","ы","ами","ах"],["","","","","",""]]}}
h_f["глаз"] = {:bs => ["глаз", ["глаз"]], :tpl => "сущ ru m ina 1c(1)(2)", :end => {:s => ["","а","у","","ом","е"], :pl => [["а","","ам","а","ами","ах"]]}}

# ----- detect base words and process them ---------------
h_f.each_key do |el|
	b = h_f[el]
	bs = b[:bs]
	bs_f = bs.flatten
	bs_f.each do |a|
		base = a
		f_h_f = {}
		new_rep_words.each do |k,v|  
			f_h_f[k] = v if k.include?(base)
		end
		base_words.merge!(f_h_f) 
	end
end

# ----- detect word declension and other attr-s -----------
base_words.each_key do |k|
	h_f.each_key do |k1|
		if k.index(k1)
			o_h = {}
			sng_dcln = []
			prl_dcln = []
			end_wrd = ending( k, k1 )
#			puts "Слово : #{k} , k1 = #{k1} ----- Окончание : #{end_wrd}" # temp
			o_f.puts "\nСлово : #{k} , k1 = #{k1} ----- Окончание : #{end_wrd}" # temp
			if end_wrd
				sng_tmpl = h_f[k1][:end][:s]
#				puts "single : #{sng_tmpl}" # temp
				prl_tmpl = h_f[k1][:end][:pl]
#				puts "plural : #{prl_tmpl}" # temp
				sng_dcln = declension( end_wrd, sng_tmpl )
				ii = 0
				prl_dcln = []
				prl_tmpl.each do |e|  
					prl_dcln[ii] = declension( end_wrd, e )
					ii += 1
				end
				o_h[k] = {:s => sng_dcln}
				o_h[k] = {:p1 => prl_dcln[0]} unless prl_dcln[0][0].nil? 
				if !prl_dcln[1].nil?
					o_h[k] = {:p2 => prl_dcln[1]} unless prl_dcln[1][0].nil? 
				end
			end
#			print "++ #{o_h}\n" unless o_h.empty? 	# temp
			o_f.print "++ #{o_h}\n" unless o_h.empty? 	# temp
# => o_f.puts base_words unless base_words.nil?

#			base_words.each_key do |k|  
#				puts k, base_words[k]
				o_f.puts k, base_words[k]
				arr_tmp = base_words[k][:s]
#				arr_tmp.each { |e|  puts all_snt[e] } # temp
				arr_tmp.each { |e|  o_f.puts all_snt[e] } # temp
#			end	
		end
	end

end

# ----- close in and out files ---------------------------
in_file.close
o_f.close