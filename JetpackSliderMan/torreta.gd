extends Node2D

export var vida = 3
var disparo = false
onready var bala = load("res://BalaMala.tscn")
export var flip = false;
var direccion = 70
export var delay = 0;
var ready = false
export var cooldown = 2.2
var alert = false
var player = null
export var alertRange = 600


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _ready():
	$Cooldown.start(cooldown)
	$Delay.start(delay)
	player = find_node_by_name(get_tree().get_root(), "Character")
	if flip:
		$Sprite.flip_h = true
		direccion = direccion * -1

func find_node_by_name(root, name):

	if(root.get_name() == name): return root

	for child in root.get_children():
		if(child.get_name() == name):
			return child

		var found = find_node_by_name(child, name)

		if(found): return found

	return null

func _on_Cooldown_timeout():
	if ready and alert:
		$Shot.play(0)
		var balita = bala.instance()
		balita.position.y = position.y - 30
		balita.position.x = position.x + direccion
		get_parent().add_child(balita)
	pass # Replace with function body.

func _process(delta):
	if(global_position.distance_to(player.position) < alertRange):
		print("On range")
		alert = true
	else:
		alert = false

func _on_CollisionShape2D_area_entered(area):
	if "Bullet" in area.name:
		if vida == 1:
			$Cooldown.stop() 
			$Timer2.start(0.5)
			set_physics_process(false)
			$Sprite.play("death")
			$Death.play(0)
		else:
			$Damage.play(0)
			vida = vida - 1
			$Sprite/AnimationPlayer.play("hurtr")
	pass # Replace with function body.

func _on_Timer2_timeout():
	queue_free()
	pass # Replace with function body.

func _on_Delay_timeout():
	ready = true;
	pass # Replace with function body.
