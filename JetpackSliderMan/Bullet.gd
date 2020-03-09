extends Node2D

var velocity = Vector2()
export var speed = 100
var direccion = Vector2.RIGHT


func direction(direction):
	direccion = direction

func _process(delta):
	if direccion == Vector2.LEFT:
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false
	position += direccion * speed * delta


func _on_CollisionShape2D_body_entered(body):
	queue_free()
	pass # Replace with function body.


func _on_CollisionShape2D_area_entered(area):
	queue_free()
	pass # Replace with function body.
