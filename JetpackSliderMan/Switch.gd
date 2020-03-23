extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var tile_to_remove = 10
var tileset = null
var activado = false

# Called when the node enters the scene tree for the first time.
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

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	if "Bullet" in area.name and !activado:
		$On.play(0)
		$AnimatedSprite.play("OFF")
		tileset.tile_set.remove_tile(tile_to_remove)
		activado = true
	pass # Replace with function body.
