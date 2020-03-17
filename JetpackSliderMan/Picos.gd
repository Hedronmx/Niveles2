extends StaticBody2D


export var falling = false
export var speed = 30
export var time_to_die = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	if falling:
		$"Death Timer".start(time_to_die)
	pass # Replace with function body.


func _process(delta):
	if falling:
		position.y = position.y + speed * delta
	pass


func _on_Area2D_body_entered(body):
	print("Test")
	body.queue_free()
	$Timer.start(1)
	pass # Replace with function body.


func _on_Timer_timeout():
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	falling = false
	pass # Replace with function body.


func _on_Death_Timer_timeout():
	queue_free()
	pass # Replace with function body.
