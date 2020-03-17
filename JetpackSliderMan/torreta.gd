extends Node2D

export var vida = 2
var disparo = false
onready var bala = load("res://BalaMala.tscn")
export var flip = false;
var direccion = 70


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _ready():
	if flip:
		$Sprite.flip_h = true
		direccion = direccion * -1

func _on_Timer_timeout():
	var balita = bala.instance()
	balita.position.y = position.y
	balita.position.x = position.x + direccion
	get_parent().add_child(balita)
	pass # Replace with function body.


func _on_CollisionShape2D_area_entered(area):
	if vida == 0:
		queue_free()
	else:
		vida = vida - 1
	pass # Replace with function body.
