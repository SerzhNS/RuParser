#!/usr/bin/ruby
#coding: utf-8

class Word < String
#
# Outdated class.
#

require_relative "const"

	include Const

	def initialize(a)
		super
	end

	def upcase
		a = self.strip
		return a.gsub(/[абвгдеёжзийклмнопрстуфхцчшщъыьэюяabcdefghijklmnopqrstuvwxyz]/,DWTOUP)
	end

	def upcase!
		self.strip!
		return self.gsub!(/[абвгдеёжзийклмнопрстуфхцчшщъыьэюяabcdefghijklmnopqrstuvwxyz]/,DWTOUP)
	end

	def downcase
		a = self.strip
		return a.gsub(/[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯABCDEFGHIJKLMNOPQRSTUVWXYZ]/,UPTODW)
	end

	def downcase!
		self.strip!
		return self.gsub!(/[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯABCDEFGHIJKLMNOPQRSTUVWXYZ]{1}/,UPTODW)
	end

	def capitalize
		a = self.strip
		return a.gsub(/^[абвгдеёжзийклмнопрстуфхцчшщъыьэюяabcdefghijklmnopqrstuvwxyz]/,DWTOUP)
	end
	
	def capitalize!
		self.strip!
		return self.gsub!(/^[абвгдеёжзийклмнопрстуфхцчшщъыьэюяabcdefghijklmnopqrstuvwxyz]/,DWTOUP)
	end

	def uncapitalize
		a = self.strip!
		return a.gsub(/^[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯABCDEFGHIJKLMNOPQRSTUVWXYZ]/,UPTODW)
	end

	def uncapitalize!
		self.strip!
		return self.gsub!(/^[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯABCDEFGHIJKLMNOPQRSTUVWXYZ]/,UPTODW)
	end



end
