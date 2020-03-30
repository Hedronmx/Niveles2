extends Node2D
var dead = false
export var respawnTime = 3

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if "Character" in body.name and !dead:
		body.refill()
		visible = false
		dead = true
		$Respawn.start(respawnTime)
	pass # Replace with function body.


func _on_Respawn_timeout():
	dead = false
	visible = true
	pass # Replace with function body.
