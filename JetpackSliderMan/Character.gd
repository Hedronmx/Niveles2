extends KinematicBody2D

export (int) var speed = 800
export (int) var jump_speed = -400
export (int) var gravity = 4000
var flipped = false 
var slide = false

var velocity = Vector2.ZERO

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
		$Sprite.play("Run")
		$Sprite.flip_h = false
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed
		$Sprite.play("Run")
		$Sprite.flip_h = true

func _physics_process(delta):
	if slide == false:
		print("Entro")
		get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_pressed("jump"):
			velocity.y = jump_speed
	if !is_on_floor() and !slide:
		$Sprite.play("Jump")
	if Input.is_action_just_pressed("slide"):
		if !slide:
			slide = true
			$Sprite.play("Duck")
			$Timer.start(0.5)
			$CollisionShape2D.shape.extents = Vector2(39,20)

func _on_Timer_timeout():
	$CollisionShape2D.shape.extents = Vector2(39,33)
	$Sprite.play("Idle")
	slide = false
	pass # Replace with function body.
