#!/usr/bin/ruby
#encoding utf-8

# Task 01. Parse text file. Put all unique words in a 1 column table.
# Make a range of repeateable words with their frequacny more than one.

uniq_words = []
rep_words = {}
alf = {}
up_let = ("А".."Я").to_a + ("A".."Z").to_a
dw_let = ("а".."я").to_a + ("a".."z").to_a

j = 0
up_let.each { |chr|
	alf[chr] = dw_let[j]
	j += 1
	}

in_file = File.new("text_01.txt") 
arr_lines = in_file.readlines

arr_lines.each { |line| 
	line.gsub!(/[.,:"'|„“«»—0123456789]/,' ')
	arr_tmp = line.split
	arr_tmp.each { |w| w.gsub!(/[АБВГДЕЖЗИКЛМНОПРСТУФХЦЧШЬЫЪЭЮЯABCDEFGJIKLMNOPQRSTUYWZ]/,alf)
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
