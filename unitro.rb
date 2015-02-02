class BaseEntity
end

class Animal
end

class User
end

class BaseItem
end

class BasePlant
end

class Cell
end

class Matrix
	
end

class World
	def initialize()
		@matrix = Matrix.new
		@users= []
		@animals= []
	end
end

class Solver
end

class WorldView
end

class Server
	def initialize
		@global_world = World.new
	end
end

class Client
	def initialize
		@local_world = World.new
	end
end
