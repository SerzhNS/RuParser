#!/usr/bin/ruby
# coding: utf-8

# Task 01. Parse text file. Put all unique words in a 1 column table.
# Make a range of repeateable words with their frequacny more than one.
require_relative "const"
require_relative "word"
require_relative "statements"

include Const

# ----- initialize lists ans hashes --------------
rep_words = {}
new_rep_words = {}
fr_rep_words = {}

# ----- initialize input and putput files --------
in_file = File.new("/home/ssn/RoR_02/Anna_Karenina.txt", "rt:utf-8") 
o_f = File.new("/home/ssn/RoR_02/step_5/out_06.txt", "w:utf-8")

# ----- select words and put them in orders: a) alfabetic and b) friequency orders 
arr_lines = Statement.new(in_file.readlines)
arr_lines.each do |line|
	Const::OTHWORDS.each { |e| line.gsub!((" "+e+" ")," ")  }
end

rep_words = arr_lines.split_statements

# ----- output these orders into output file -----------
# ----- IMPORTANT! Reverse order of words!! ------------
new_rep_words = rep_words.sort { |a,b| b<=>a }
#new_rep_words = new_rep_words.to_h
# new_rep_words.each { |e,v| o_f.print "#{e} : #{v}\n" } 
# o_f.puts ("\n\n\n==========================")
fr_rep_words = rep_words.sort { |a,b| b[1][:q] <=> a[1][:q] }
fr_rep_words = fr_rep_words.to_h
# fr_rep_words.each { |e,v| o_f.print "#{e} : #{v}\n" } 

# o_f.puts ("\n\n\n+++++++++++++++++++++++++++++++")
# k = 0
# arr_lines.each { |line| o_f.puts "-- #{k} : #{line}"; k += 1}

# ----- determine a root/base of a word ---------------------
wrd_base = {}
arr_size = new_rep_words.size

# new_rep_words.each_index do |w|
w = 0
loop do 
	arr_c = []
	j_c = 0
	h = {}
	# ----- take LEV next words after this one and compare to find common root ----
	Const::LEV.times do |wn|
		a = new_rep_words[w][0]
		new_rep_words[w+wn+1].nil? ? break : b = new_rep_words[w+wn+1][0]
		c = a.compare(b)
		puts ": #{a} - #{b} - #{c}" 	# temp
		if !c.nil?
		 	prc = c.to_f / a.size.to_f
		 	if prc >= Const::PERC && a.size > 3	&& b.size.to_f / a.size.to_f <= 1.0	# criterion of commonality these words --
		 		arr_c[j_c] = c
		 		j_c += 1 
			else
				break
		 	end
		 else
		 	break
		 end 
	end
	unless arr_c.empty?		# ----- list of words thar have a proximity  ---
		min_l = arr_c.min 	# ----- the root with min length -----
		d = new_rep_words[w][0].to_s[0..min_l-1]
		puts "-- #{arr_c} -- #{d}" # ? #{new_rep_words[w]}"  # temp

# ----- join all words with the same base -------------
		wrd_base[d] = {:q => 1, :t => [new_rep_words[w][0]], :s => [new_rep_words[w][1][:s]]}
#		wrd_base[d] = {:q => 0, :t => [], :s => []}
	#	puts "wrd_base : #{wrd_base[d]}"	# temp
		n1 = 0
		l1 = []
		j_c.times do |n|
			h = new_rep_words[w+n+1].to_a	# temp
			h1 = h[1].to_a
#			puts "=== #{h} : #{h1}"	# temp
			wrd_base[d][:t] << h[0]
			n1 += h1[0][1].to_i
			wrd_base[d][:q] = n1
			l1 << h1[1][1] 
			wrd_base[d][:s] = l1
		end
	end
	w += j_c > 0 ? j_c + 1 : 1 
	break if w >= 150 || w >= arr_size
end

o_f.puts ("\n\n\n______________________________________")
wrd_base.each { |e,v| o_f.print "#{e} : #{v}\n" } 

# ----- close input & output files -----------------------------
in_file.close
o_f.close