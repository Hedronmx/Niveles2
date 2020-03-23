extends StaticBody2D


export var falling = false
export var speed = 30
export var time_to_die = 10
export var goUp = false


# Called when the node enters the scene tree for the first time.
func _ready():
	if goUp:
		$Sprite.flip_v = true
	if goUp:
		$"Death Timer".start(time_to_die)
	pass # Replace with function body.


func _process(delta):
	if falling and !goUp:
		position.y = position.y + speed * delta
	elif falling and goUp:
		position.y = position.y + speed * -1 * delta
	pass


func _on_Area2D_body_entered(body):
	if "Character" in body.name :
		body.die(self)
	falling = false
	pass # Replace with function body.


func _on_Death_Timer_timeout():
#	queue_free()
	pass # Replace with function body.
