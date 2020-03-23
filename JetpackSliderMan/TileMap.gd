extends TileMap

onready var texture = preload("res://Tiles/platformPack_tile009.png")
onready var colision = preload("res://empty.tres")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	tile_set.tile_set_texture(11,texture)
	tile_set.tile_set_shape(11, 9000, null)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
