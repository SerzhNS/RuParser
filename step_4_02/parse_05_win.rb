#!/usr/bin/ruby
# coding: utf-8

# Task 01. Parse text file. Put all unique words in a 1 column table.
# Make a range of repeateable words with their frequacny more than one.

require_relative "word"

uniq_words = []
rep_words = {}
new_rep_words = {}
fr_rep_words = {}

in_file = File.new("C:\\Ruby\\Test\\step_4\\Strategy_002.txt", "rt:utf-8") 
o_f = File.new("C:\\Ruby\\Test\\step_4\\out_05.txt", "w:utf-8")
arr_lines = in_file.readlines
j_snt = 0
arr_lines.each do |l| 
	line = Word.new(l)
	line.gsub!(/[.,:"'-0123456789?;!]/,' ') if !line.empty?
	arr_tmp = line.split
	arr_tmp.each do |w| 
		w = w.downcase
		if rep_words.include?(w)
			rep_words[w][:q] += 1
			rep_words[w][:s] << j_snt
		else
			rep_words[w] = {:q => 1, :s => [j_snt]}
		end
	end
	j_snt += 1
end

new_rep_words = rep_words.sort { |a,b| a<=>b }
new_rep_words.each { |e,v| o_f.print "#{e} : #{v}\n" } 
o_f.puts ("==========================")
new_rep_words = rep_words.sort { |a,b| b[1][:q] <=> a[1][:q] }
fr_rep_words = new_rep_words.to_h
fr_rep_words.each { |e,v| o_f.print "#{e} : #{v}\n" } 

in_file.close
o_f.close