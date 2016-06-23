#!/usr/bin/ruby
#encoding utf-8

# Task 01. Parse text file. Put all unique words in a 1 column table.
# Make a range of repeateable words with their frequacny more than one.

require_relative "word"

uniq_words = []
rep_words = {}
new_rep_words = {}
fr_rep_words = {}

in_file = File.new("C:\\Ruby\\Test\\step_4\\Strategy_for_Kozin.txt") 
o_f = File.new("C:\Ruby\Test\step_4\\step_4\\out_02.txt", "w")
arr_lines = in_file.readlines

arr_lines.each { |l| 
	line = Word.new(l)
	line.gsub!(/[.,:"'|„“«»—0123456789*?;…!]/,' ')
	arr_tmp = line.split
	arr_tmp.each { |w| w.downcase!
		if !uniq_words.empty? && uniq_words.include?(w)
			if rep_words[w] == nil
				rep_words[w] = 2
			else	
				qnty = rep_words[w].to_i
				qnty += 1
				rep_words[w] = qnty
			end	  
		else
			uniq_words << w	
		end
	 }
  }
#o_f.puts uniq_words
#o_f.puts rep_words

new_rep_words = rep_words.sort { |a,b| a<=>b }.to_h
o_f.puts new_rep_words
o_f.puts ("==========================")
new_rep_words = rep_words.sort { |a,b| b[1] <=> a[1] }
fr_rep_words = new_rep_words.to_h
o_f.puts fr_rep_words
#o_f.print "+++++++++\n#{new_rep_words}" 

#uniq_words_sort = arr_uniq.to_h
#o_f.puts uniq_words_sort

in_file.close
o_f.close