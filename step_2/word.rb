class Word < String
#
# Outdated class.
#

require_relative "const"

	include Const

	def initialize(a)
		super
	end


	def upcase!
		super
		self.strip!
		self.gsub!(/[абвгдеёжзийклмнопрстуфхцчшщъыьэюяabcdefghijklmnopqrstuvwxyz]/,DWTOUP)
		self
	end

	def downcase!
		super
		self.strip!
		self.gsub!(/[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯABCDEFGHIJKLMNOPQRSTUVWXYZ]/,UPTODW)
		self
	end
	
	def capitalize!
		super
		self.strip!
		self.gsub!(/^[абвгдеёжзийклмнопрстуфхцчшщъыьэюяabcdefghijklmnopqrstuvwxyz]/,DWTOUP)
		self
	end

	def uncapitalize!
		self.strip!
		self.gsub!(/^[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯABCDEFGHIJKLMNOPQRSTUVWXYZ]/,UPTODW)
		self
	end



end
