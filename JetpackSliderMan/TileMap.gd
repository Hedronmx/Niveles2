extends TileMap

onready var textureAzul = preload("res://Tiles/platformPack_tile009.png")
onready var textureDorado = preload("res://Tiles/platformPack_tile059.png")
onready var colision = preload("res://2DCOllisiontile.tres")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	tile_set = tile_set.duplicate()
	tile_set.tile_set_texture(11, textureAzul)
	tile_set.tile_set_shape(11, 9000, null)
	
	tile_set.tile_set_texture(10, textureDorado)
	tile_set.tile_set_shape(10, 9000, colision)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
