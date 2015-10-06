class Inventory

	attr_accessor :name

	def initialize(name)
		@name = name
		@names = []
		@number = []
	end

	def addItem(name, number)
		if @names.include? name
			@number[@names.index(name)] += number
		else
			@names.push(name)
			@number.push(number)
		end
		
		puts "#{number} #{name}'s added"
	end

	def infoName
		stringFinal = ""
		if @names != nil
			(0...@names.length).each do |n|
				stringFinal += "#{@names[n] }"
			end
		end
		stringFinal
	end

	def infoNumber
		stringFinal = ""
		if @number != nil
			(0...@number.length).each do |n|
				stringFinal += "#{@number[n]} "
			end
		end
		stringFinal
	end

end