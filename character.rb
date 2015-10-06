class Character

	attr_accessor :name, :health, :type, :x, :y, :underspot

	def initialize(name, health, type, x, y, underspot) 
		@name = name
		@health = health
		@type = type
		@x = x
		@y = y
		@underspot = underspot
	end

end