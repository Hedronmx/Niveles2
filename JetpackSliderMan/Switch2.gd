extends StaticBody2D

onready var texture =  preload("res://Tiles/platformPack_tile007.png")
onready var colision = preload("res://2DCOllisiontile.tres")
export var tile_to_appear= 11
var tileset = null
var activado = false;

func _ready():
	tileset = find_node_by_name(get_tree().get_root(), "TileMap")
	pass # Replace with function body.


func find_node_by_name(root, name):

	if(root.get_name() == name): return root

	for child in root.get_children():
		if(child.get_name() == name):
			return child

		var found = find_node_by_name(child, name)

		if(found): return found

	return null


func _on_Area2D_area_entered(area):
	if "Bullet" in area.name and !activado:
		$On.play(0)
		$AnimatedSprite.play("OFF")
		tileset.tile_set.tile_set_texture(tile_to_appear,texture)
		tileset.tile_set.tile_set_shape(tile_to_appear, 9000, colision)
		activado = true
	
	pass # Replace with function body.
