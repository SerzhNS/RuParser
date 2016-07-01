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
		return self.gsub!(/[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯABCDEFGHIJKLMNOPQRSTUVWXYZ]/,UPTODW)
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

	def compare(w)
		l = w.size < self.size ? w.size : self.size 
		cmp = nil
		l.times do |ch|
			if self[ch] == w[ch]
				cmp = 0 if cmp.nil?
				cmp += 1
			end
		end
		return cmp
	end


end
