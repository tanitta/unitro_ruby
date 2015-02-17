module Unitro
	
	################################################################
	#Utility
	################################################################
	
	#Unitroの設定をまとめる
	class Setting
		def initialize
			@matrix_size = {x:10, y:10, z:10}
		end
		
		attr_reader :matrix_size
	end
	
	# ?
	class ServerSetting
	end
	
	# ?
	class ClientSetting
	end
	
	# 3Dモデルなどのリソースを定義
	class Resource
	end

	# Resourceを管理する．
	# Clientでの描画処理は全てこのクラスを経由して行う
	class ResourceManager
		def initialize
			@resources = {}
		end
		
		def add_resource
		end
		
		def remove_resource
		end
		
		def draw(name, x, y, z)
		end
	end

	# Cellに格納されない動的なオブジェクト
	# 座標等を定義
	class BaseEntity
	end

	class BaseAnimal < BaseEntity
	end

	class User < BaseEntity
	end

	################################################################
	#Matrix
	################################################################
	class BaseItem
		def update
		end
	end

	class BasePlant
		def update
		end
	end

	class Parameter
	end
	
	# 水
	class Water < Parameter
		def initialize
			@in = 0.0
			@out = 0.0
		end
		
		def all
			self.in + self.out
		end
	end

	# 養分
	class Nutrition < Parameter
	end

	class Cell
		def initialize
			@parameters = {
				soil:0.0, # 土 [0,
				water:0.0, # 水 [0,
				water_in:0.0, # 土に染み込んでいる水の量 [0,
				water_out:0.0, # 土に染み込んでいない水の量 [0,
				temp:0.0, # 温度
				air:0.0, # 空気
				nut_p:0.0, # 養分
				nut_n:0.0, # 養分
				brightness:0.0 # 明るさ
			}
			
			@plant = BasePlant.new() 
			@item = BaseItem.new()
		end
		
		def [](hash)
			@parameters[hash]
		end
	end

	class CellMatrix
		def initialize(setting)
			@setting= setting 
			@matrix = Array.new(@setting.matrix_size[:x]){Array.new(@setting.matrix_size[:y]){Array.new(@setting.matrix_size[:z],Cell.new)}}
		end
		
		def inspect
		end
		
		def [](index)
			@matrix[index]
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
	
	class Rule
		def initialize(typeA,typeB,position)
			@condition
			@position = position
			@substance_type
			@substance_quantity
		end
		
		def condition?(a,b)
			if a[:water] - b[:water] > 0
				true
			end
		end
		
		# def match?(type)
		# 	#書き換えるtypeのみでマッチング
		# 	if type == typeA
		# 		true	
		# 	elsif type == typeB
		# 		true
		# 	else
		# 		false
		# 	end
		# end
		
		def generate_cell_rule
			
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
	#App
	################################################################
	class Server
		def initialize(setting)
			@global_world = World.new(setting)
			@solver = Solver.new(@global_world)
		end
		
		def setup
		end
		
		def update
		end
	end

	class Client
		# SDLはClient,Machineのみで使う
		def initialize(setting)
			@local_world = World.new(setting)
			
			@world_controller = WorldController.new(@local_world)
			@world_view = WorldView.new(@local_world)
		end
		
		def setup
		end
		
		def update
		end
	end

	class BaseApp
		def initialize
		end
	end

	class Machine
		# SDLはClient,Machineのみで使う
		def initialize(app)
			@app = app
		end
		
		def update
			@app.update
		end
		
		# 指定したフレームレートでスレッドを生成，実行
		def start(rate)
		end
		
		# スレッドを停止
		def stop
		end
		
		# アプリケーションを初期化
		def reset
		end
	end
end

 


class Sketch
	class Hoge
		def test
			size(200,200)
		end
	end
	
	def setup
		@setting = Unitro::Setting.new
		@client = Unitro::Client.new(@setting)
		@client_machine = Unitro::Machine.new(@client)
		hoge = Hoge.new
		hoge.test
	end

	def draw
		@client_machine.update
	end
end

setting = Unitro::Setting.new

matrix = Unitro::CellMatrix.new(setting)
# matrix[0][0][0][:soil]
