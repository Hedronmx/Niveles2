extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var rect = find_node_by_name(get_tree().get_root(), "TileMap").get_used_rect()
	var cellSize = find_node_by_name(get_tree().get_root(), "TileMap").cell_size
	limit_left = rect.position.x * cellSize.x
	limit_right = rect.end.x * cellSize.x
	limit_top = rect.position.y * cellSize.y
	limit_bottom = rect.end.y * cellSize.y
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
