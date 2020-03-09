extends Node2D

var vida = 2
var disparo = false
onready var bala = load("res://BalaMala.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	var balita = bala.instance()
	balita.position.y = position.y
	balita.position.x = position.x - 70
	get_parent().add_child(balita)
	pass # Replace with function body.


func _on_CollisionShape2D_area_entered(area):
	if vida == 0:
		queue_free()
	else:
		vida = vida - 1
	pass # Replace with function body.
