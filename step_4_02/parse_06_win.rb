#!/usr/bin/ruby
# coding: Windows-1251

# Task 01. Parse text file. Put all unique words in a 1 column table.
# Make a range of repeateable words with their frequacny more than one.

require_relative "word"
require "win32ole"


uniq_words = []
rep_words = {}
new_rep_words = {}
fr_rep_words = {}

excel = WIN32OLE.new('Excel.Application')
#excel.Visible = true
exl_doc = excel.Workbooks.Add()
ws_ent = exl_doc.Worksheets(1)
rng_ent = ws_ent.Range('A1:B500')

in_file = File.new("C:\\Ruby\\Test\\step_4\\Strategy_002.txt", "r:Windows-1251") 
o_f = File.new("C:\\Ruby\\Test\\step_4\\out_02.txt", "w:Windows-1251")
arr_lines = in_file.readlines
j_snt = 0
arr_lines.each { |l| 
	line = Word.new(l)
	line.encode!("Windows-1251")
#	line.encode!('cp1251')
	line.gsub!(/[.,:"'|„“«»—0123456789*?;…!]/,' ')
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
#o_f.puts uniq_words
#o_f.puts rep_words


#ic = Iconv.new('UTF-8','Windows-1251')

new_rep_words = rep_words.sort { |a,b| a<=>b }
new_rep_words.each_index do |i|
	i = 0 if i.nil?
	wrd = new_rep_words[i][0].to_s
	rng_ent.Cells(i+1,1).Value = wrd.encode("Windows-1251")
#	rng_ent.Cells(i+1,2).Value = new_rep_words[i][1].to_s
end
#new_rep_words.each_key { |k| k.encode!('cp1251','UTF-8') }
#o_f.write new_rep_words
#o_f.puts ("==========================")
fr_rep_words = rep_words.sort { |a,b| b[1][:q] <=> a[1][:q] }
#fr_rep_words = new_rep_words
#fr_rep_words.each_key { |k| k.encode!('cp1251') }
o_f.write fr_rep_words
#o_f.print "+++++++++\n#{new_rep_words}" 

#uniq_words_sort = arr_uniq.to_h
#o_f.puts uniq_words_sort

in_file.close
o_f.close

exl_doc.SaveAs("C:\\Ruby\\Test\\step_4\\out_txt.xls", 18)
exl_doc.Close
excel.Visible = false