#!/usr/bin/ruby
#encoding utf-8

require_relative 'word' 
#require_relative 'string'

begin
	
	f = File.open("res_01.txt", "w")

	a = Word.new("   привет ")
	f.puts a, a.class
	b = a.upcase
	f.puts b, b.class
	f.puts b.uncapitalize!, b.class

	f.puts "========="
	a = String.new("Привет ")
	f.puts a, a.class
	b = a.capitalize
	f.puts b, b.class
	f.puts b.downcase!, b.class
	
	f.close

rescue NoMethodError => e
	f.print "Error: #{e.backtrace} : #{e.message}\n"
	raise
end