require_relative "character.rb"
require_relative "inventory.rb"
require 'io/console'

map = []

char = Character.new("Man", 100, "Fighter", 4, 7, "| |")
inven = Inventory.new("Main")
game = true

(0...10).each do |n|
	currentArray = []
	random = nil
	(0...10).each do |x|
		random = rand(10)
		if random > 8
			currentArray.push("|/|")
		elsif random > 9
			currentArray.push("|^|")
		else
			currentArray.push("| |")
		end
	end
	map.push(currentArray)
end

def render(map, inven)
	map.each do |element|
		puts element.join(" ")
	end
	puts """

	"""
	puts inven.infoName
	puts inven.infoNumber
end

def update(character, map,inven)
	place = gets.chomp
	if place.downcase == "d" && character.x < 9
		map[character.y][character.x] = character.underspot
		character.underspot = map[character.y][character.x + 1]
		character.x += 1
	elsif place.downcase == "a" && character.x > 0
		map[character.y][character.x] = character.underspot
		character.underspot = map[character.y][character.x - 1]
		character.x -= 1
	elsif place.downcase == "w" && character.y > 0
		map[character.y][character.x] = character.underspot
		character.underspot = map[character.y - 1][character.x]
		character.y -= 1
	elsif place.downcase == "d" && character.y < 9
		map[character.y][character.x] = character.underspot
		character.underspot = map[character.y + 1][character.x]
		character.y += 1
	elsif place.downcase == "p" && map[character.y][character.x] != "| |"
		if character.underspot == "|/|"
			inven.addItem("Stick", 1)
		end
		character.underspot = "| |"
	else
		puts "That is not a valid command"
	end
	map[character.y][character.x] = "|O|"
end

while game 
	update(char, map, inven)
	render(map, inven)
	sleep(0.5)
end