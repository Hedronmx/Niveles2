extends Node2D


var velocity = Vector2()
export var speed = 800
export var direccion = Vector2.LEFT

func _process(delta):
	position += direccion * speed * delta

func _on_Area2D_body_entered(body):
	if "Character" in body.name:
		body.queue_free()
		get_tree().reload_current_scene()
	queue_free()
	pass # Replace with function body.


func _on_Timer_timeout():
	pass # Replace with function body.