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
	def initialize
		@parameters = {
			soil:0.0,
			water:0.0,
			water_in:0.0,
			water_out:0.0,
			temp:0.0,
			air:0.0,
			nut_p:0.0,
			nut_n:0.0,
			brightness:0.0
		}
		@plant = BasePlant.new()
		@item = BaseItem.new()
	end
end

class Setting
	def initialize
		@matrix_size = {x:10, y:10, z:10}
	end
	
	attr_reader :matrix_size
end

class CellMatrix
	def initialize(setting)
		@setting= setting 
		@matrix = Array.new(@setting.matrix_size[:x]){Array.new(@setting.matrix_size[:y]){Array.new(@setting.matrix_size[:z],Cell.new)}}
	end
end

################################################################
#World
################################################################
class World
	def initialize(setting)
		@setting= setting 
		@matrix = CellMatrix.new(setting)
		@users= []
		@animals= []
	end
end

class WorldView
	def initialize(world)
		@world = world
	end
end

class WorldController
	def initialize(world)
		@world = world
	end
end

class Solver
	def initialize(world)
		@world = world
	end
	
	def update
	end
end

################################################################
#
################################################################
class Server
	def initialize(setting)
		@global_world = World.new(setting)
		@solver = Solver.new(@global_world)
	end
	
	def calc
	end
end

class Client
	def initialize(setting)
		@local_world = World.new(setting)
		
		@world_controller = WorldController.new(@local_world)
		@world_view = WorldView.new(@local_world)
	end
end

setting = Setting.new
client = Client.new(setting)
