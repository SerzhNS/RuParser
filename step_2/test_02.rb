#!/usr/bin/ruby
#encoding utf-8

require_relative 'const' 
#require_relative 'word'
require_relative 'string'



#a = Word.new("  Привет ")
a = "   привет "
b = a.capitalize!
puts b
puts b.downcase!