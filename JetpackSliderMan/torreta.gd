extends Node2D

export var vida = 2
var disparo = false
onready var bala = load("res://BalaMala.tscn")
export var flip = false;
var direccion = 70
export var delay = 0;
var ready = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _ready():
	$Delay.start(delay)
	if flip:
		$Sprite.flip_h = true
		direccion = direccion * -1

func _on_Timer_timeout():
	if ready:
		$Shot.play(0)
		var balita = bala.instance()
		balita.position.y = position.y - 30
		balita.position.x = position.x + direccion
		get_parent().add_child(balita)
	pass # Replace with function body.


func _on_CollisionShape2D_area_entered(area):
	if "Bullet" in area.name:
		if vida == 1:
			$Timer2.start(1)
			set_physics_process(false)
			$Sprite.play("death")
			$Death.play(0)
			$Timer.stop()
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
