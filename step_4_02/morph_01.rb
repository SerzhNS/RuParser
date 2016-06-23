#!/usr/bin/ruby
#encoding utf-8

#
# The prog determines declension of an word on an the word base.
#

def coinc?( word, base )
	# output: nil - no coincedence, 0 - from beginning, >0 - prefix exists
	return word.index(base)
end

def ending( word, base )
		ind = word.index(base)
	if ind
		ind_end = ind + base.length
		return word[ind_end..100]
	end
	return ind
end

def declension( ending, templ  )
	decl = []
	templ.each do | e, k |
		k = 0 if k == nil
		if !e.empty? && e == ending
			decl[qnty] = DECL[k]
			qnty = 0 if qnty == nil
			qnty += 1
		end
		k += 1
	end
	return qnty, decl
end
