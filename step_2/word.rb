class Word < String
#
# Outdated class.
#

=begin
	include Const

	def initialize(a)
		super
		@w = a.strip
		puts @w
	end


	def upcase!
		super
		@w.gsub!(/[абвгдеёжзийклмнопрстуфхцчшщъыьэюяabcdefghijklmnopqrstuvwxyz]/,DWTOUP)
		@w
	end

	def downcase!
		super
		@w.gsub!(/[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯABCDEFGHIJKLMNOPQRSTUVWXYZ]/,UPTODW)
		@w
	end
	
	def capitalize!
		super
		@w.gsub!(/^[абвгдеёжзийклмнопрстуфхцчшщъыьэюяabcdefghijklmnopqrstuvwxyz]/,DWTOUP)
		@w
	end
=end


end
