#!/usr/bin/ruby
#encoding utf-8

# Task 01. Parse text file. Put all unique words in a 1 column table.
# Make a range of repeateable words with their frequacny more than one.

require_relative "word"

uniq_words = []
rep_words = {}

in_file = File.new("/home/ssn/RoR_02/Anna_Karenina.txt") 
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
puts uniq_words
puts rep_words

in_file.close
