extends Node2D


var velocity = Vector2()
export var speed = 8
export var direccion = Vector2.UP

func _ready():
	scale = Vector2(0.6,0.6)

func _process(delta):
	translate(transform.x.normalized() * speed)

func _on_Area2D_body_entered(body):
	if "Character" in body.name:
		body.die(self)
	if body.get("slide") == null:
		queue_free()
	pass # Replace with function body.


func _on_Timer_timeout():
	pass # Replace with function body.
