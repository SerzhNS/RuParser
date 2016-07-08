#!/usr/bin/ruby
#coding: utf-8

class Statement < Array

require_relative "word"
require_relative "morph"

	def initialize(a)
		super
	end

	# ----- split a list of statements into hash -------
	def split_statements
		rep_words = {}
		j_snt = 0
		self.each do |l| 
			line = Word.new(l)
			line.gsub!(/[.,:"'-0123456789?;!…–»«\[\]]/,' ') if !line.empty?
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
		return rep_words arr_tmp		
	end

	# ----- min of the values in the list -------
	def sindex(base)
		k = 0
		self.each do |el|
			if el.coins?(base)
				k += 1
				return k 
			else
				return nill
			end
		end
	end
	
end
