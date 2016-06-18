#!/usr/bin/ruby
#encoding utf-8

require_relative 'word' 
#require_relative 'string'


a = Word.new("   привет ")
puts a, a.class
b = a.capitalize!
puts b, b.class
puts b.downcase!, b.class

puts "========="
a = "   привет "
puts a, a.class
b = a.capitalize!
puts b, b.class
puts b.downcase!, b.class