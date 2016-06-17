#!/usr/bin/ruby
#encoding utf-8

class String

	#
	# The class allows operate with 2 bytes chars (Russian letters). This class is added to standard
	# String class in order to improve standard methods (upcase!, downcase!, capitalize!) and add one more
	# uncapitalize! method.
	#

	include Const

	#
	# The module consists of a few necessary constants to treat strings on Russian, mostly.
	# To correctly use the class and module dont forget their source files:
	# require_relative 'const' 
	# require_relative 'string'
	#


	def uncapitalize!
		self.strip!.gsub!(/^[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯABCDEFGHIJKLMNOPQRSTUVWXYZ]/,UPTODW)
		self
	end

	def upcase!
		self.gsub!(/[абвгдеёжзийклмнопрстуфхцчшщъыьэюяabcdefghijklmnopqrstuvwxyz]/,DWTOUP)
		self
	end

	def downcase!
		self.gsub!(/[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯABCDEFGHIJKLMNOPQRSTUVWXYZ]/,UPTODW)
		self
	end
	
	def capitalize!
		self.strip!.gsub!(/^[абвгдеёжзийклмнопрстуфхцчшщъыьэюяabcdefghijklmnopqrstuvwxyz]/,DWTOUP)
		self
	end

end
