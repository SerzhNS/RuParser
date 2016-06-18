#!/usr/bin/ruby
#encoding utf-8

module Const

	UPCHR = 'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯABCDEFGHIJKLMNOPQRSTUVWXYZ'
	DWCHR = 'абвгдеёжзийклмнопрстуфхцчшщъыьэюяabcdefghijklmnopqrstuvwxyz'
	DWGLCHR = 'аеёиоуыэюя'
	UPGLCHR = 'АЕЁИОУЫЭЮЯ'
	DWSGCHR = 'бвгджзйклмнпрстфхцчшщ'
	UPSGCHR = 'БВГДЖЗЙКЛЬНПРСТФХЦЧШЩ'
	DWOTHCHR = 'ъь'
	UPOTHCHR = 'ЪЬ'
	UPTODW = {"А"=>"а", "Б"=>"б", "В"=>"в", "Г"=>"г", "Д"=>"д", "Е"=>"е", "Ё"=>"ё",
	"Ж"=>"ж", "З"=>"з", "И"=>"и", "Й"=>"й", "К"=>"к", "Л"=>"л", "М"=>"м", "Н"=>"н",
	"О"=>"о", "П"=>"п", "Р"=>"р", "С"=>"с", "Т"=>"т", "У"=>"у", "Ф"=>"ф", "Х"=>"х",
	"Ц"=>"ц", "Ч"=>"ч", "Ш"=>"ш", "Щ"=>"щ", "Ъ"=>"ъ", "Ы"=>"ы", "Ь"=>"ь", "Э"=>"э",
	"Ю"=>"ю", "Я"=>"я", "A"=>"a", "B"=>"b", "C"=>"c", "D"=>"d", "E"=>"e", "F"=>"f",
	"G"=>"g", "H"=>"h", "I"=>"i", "J"=>"j", "K"=>"k", "L"=>"l", "M"=>"m", "N"=>"n",
	"O"=>"o", "P"=>"p", "Q"=>"q", "R"=>"r", "S"=>"s", "T"=>"t", "U"=>"u", "V"=>"v",
	"W"=>"w", "X"=>"x", "Y"=>"y", "Z"=>"z"}
	DWTOUP = UPTODW.invert
	DECL = [:imn, :rod, :dat, :vin, :tvr, :prd]



end

