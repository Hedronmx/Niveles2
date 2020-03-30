extends KinematicBody2D


export var falling = false
export var speed = 100
var direccion


# Called when the node enters the scene tree for the first time.
func _ready():
	direccion = transform.y.normalized() * -speed
	pass # Replace with function body.


func _process(delta):
	if falling:
		move_and_slide(direccion)
	pass


func _on_Area2D_body_entered(body):
	if "Character" in body.name :
		body.die(self)
	pass # Replace with function body.


func _on_Death_Timer_timeout():
#	queue_free()
	pass # Replace with function body.
