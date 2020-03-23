extends Node2D

export var vida = 2
var disparo = false
onready var bala = load("res://Laser.tscn")
export var direccion = 70
var player = null
var onlimit = false;
export var delay = 0;
var ready = false


func _ready():
	$Delay.start(delay)
	player = find_node_by_name(get_tree().get_root(), "Character")

func find_node_by_name(root, name):

	if(root.get_name() == name): return root

	for child in root.get_children():
		if(child.get_name() == name):
			return child

		var found = find_node_by_name(child, name)

		if(found): return found

	return null

func _physics_process(delta):
	$Reference.look_at(player.position)
	if onlimit:
		$Canon.look_at(player.position)
	if $Reference.rotation_degrees >= -170 and $Reference.rotation_degrees <= -5:
		onlimit = true
	else:
		onlimit = false
	pass

func _on_Timer_timeout():
	if onlimit and ready:
		$Laser.play(0.1)
		var balita = bala.instance()
		balita.global_transform = $Canon/Spawner.global_transform
		get_parent().add_child(balita)
	pass # Replace with function body.



func _on_Area2D_area_entered(area):
	if "Bullet" in area.name:
		if vida == 1:
			$Timer2.start(1)
			set_physics_process(false)
			$Sprite.play("death")
			$Death.play(0)
			$Canon.visible = false
			onlimit = false
		else:
			$Damage.play(0)
			vida = vida - 1
	pass # Replace with function body.


func _on_Timer2_timeout():
	queue_free()
	pass # Replace with function body.


func _on_Delay_timeout():
	ready = true;
	pass # Replace with function body.