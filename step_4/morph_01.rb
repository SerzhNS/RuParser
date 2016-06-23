#!/usr/bin/ruby
#encoding utf-8

#
# The prog determines declension of an word on an the word base.
#
module Morph

	require_relative "const"

	include Const

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
		qnty = nil
		templ.each_index do | i |
			e = templ[i]
			if e == ending # && !e.empty? 
				qnty = 0 if qnty.nil?
				decl[qnty] = DECL[i]
				qnty += 1
			end
		end
		return qnty, decl
	end
	
end
