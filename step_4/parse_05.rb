#!/usr/bin/ruby
#encoding utf-8

# Task 02. Parse text file. Determine part of speech, single or plural, declension of the noun.
# Print a full sentence if there are one more variant of the noun.

require_relative "word"

all_snt = []
rep_words = {}
new_rep_words = {}
h_f = {}
f_h_f = {}
base_words = {}


# ------ open input and output files --------------------
in_file = File.new("/home/ssn/RoR_02/Anna_Karenina.txt") 
o_f = File.new("/home/ssn/RoR_02/step_4/out_01.txt", "w")
arr_lines = in_file.readlines
arr_lines.each { |l| l.chomp! }

# ------ collect all sentences --------------------------
total_string = arr_lines.join
all_snt = total_string.split(".")
all_snt.each { |s| s.lstrip! }

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
			rep_words[w] = {:q => 1, :s => j_snt}
		end
		j_snt += 1
	 }
  }

# ----- sort all words in alfabet order ------------------
new_rep_words = rep_words.sort { |a,b| a<=>b }.to_h
o_f.puts new_rep_words # temp 

# ----- load all base hashes -----------------------------
# f = File.new("/home/ssn/RoR_02/step_4/conduit_02.rb")
# c_f = f.readlines
# c_f.each { |e, a| a = e.to_a; h_f[a[0]] = a[1] }
# puts h_f # temp

h_f["весн"] = {:bs => ["весн", ["весн", "весен"]], :tpl => "сущ ru f ina 1*d", :end => {:s => ["а","ы","е","у","ой","ою","е"], :pl => [["ы","","ам","ы","ами","ах"],["","","","","",""]]}}
arr_h_f = h_f.to_a

# ----- detect base words and process them ---------------
0.upto(0) do |v, b|
	b = h_f["весн"]
	puts b # temp
	bs = b[:bs]
	puts bs
	bs_f = bs.flatten
	puts bs_f	# temp
	0.upto(bs.length) do |a|
		base = bs_f[a]
		puts base
		f_h_f = new_rep_words.select { |k,v| k == base }
		base_words = base_words.merge( f_h_f )
	end
			
end
o_f.puts base_words unless base_words.nil?
	


# ----- close in and out files ---------------------------
in_file.close
o_f.close