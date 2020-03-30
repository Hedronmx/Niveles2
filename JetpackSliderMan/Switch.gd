extends StaticBody2D


export var tile_to_remove = 10
var tileset = null
var activado = false

# Called when the node enters the scene tree for the first time.
func _ready():
	tileset = find_node_by_name(get_parent(), "TileMap")
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
	if "Bullet" in area.name and !activado or "Bala_Mala" in area.name and !activado or "Lazer" in area.name and !activado:
		$On.play(0)
		$AnimatedSprite.play("OFF")
		tileset.tile_set.call_deferred("tile_set_texture", tile_to_remove, null)
		tileset.tile_set.call_deferred("tile_set_shape", tile_to_remove, 9000, null)
		activado = true
	pass # Replace with function body.
