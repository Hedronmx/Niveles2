extends KinematicBody2D

export (int) var speed = 800
export (int) var jump_speed = -400
export (int) var gravity = 4000
var flipped = false 
var slide = false
onready var bala = preload("res://Bullet.tscn")
var disparo = false
var direccion = Vector2.RIGHT
var velocity = Vector2.ZERO
export var fuel = 100;
var empty = false;

func _ready():
	get_tree().paused = false
	$Jetpack.play()
	$Jetpack.stream_paused = true

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
		$Sprite.play("Run")
		$Sprite.flip_h = false
		direccion = Vector2.RIGHT
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed
		$Sprite.play("Run")
		$Sprite.flip_h = true
		direccion = Vector2.LEFT
	if Input.is_action_just_pressed("shoot"):
		if !disparo:
			$Shot.play(0)
			var balita = bala.instance()
			balita.direction(direccion)
			if direccion == Vector2.RIGHT:
				balita.position.y = position.y + 15
				balita.position.x = position.x + 70
			elif direccion == Vector2.LEFT:
				balita.position.y = position.y + 15
				balita.position.x = position.x - 70
			get_parent().add_child(balita)
			disparo = true
			$Timer_Bala.start(0.4)

func _physics_process(delta):
	if slide == false:
		get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_pressed("jump"):
		$Jetpack.stream_paused = false
		if fuel > 0:
			velocity.y = jump_speed
			fuel -= 1.5
			get_node("ProgressBar").value = fuel
	else :
		$Jetpack.stream_paused = true
		if fuel < 100:
			fuel += 1
			get_node("ProgressBar").value = fuel
	if !is_on_floor() and !slide:
		$Sprite.play("Jump")
	if Input.is_action_just_pressed("slide"):
		if !slide and is_on_floor():
			slide = true
			set_collision_layer_bit(256,true)
			$Sprite.play("Duck")
			$Timer.start(0.5)
			$Character.shape.extents = Vector2(39,20)

func die (body):
	if !slide:
		$Death.play(0)
		$Sprite.play("Death")
		set_physics_process(false)
		if "Picos" in body.name:
			pass
		else:
			body.queue_free()
		$DeathTimer.start(1)
		$ProgressBar.visible = false


func restart ():
	get_tree().reload_current_scene()

func _on_Timer_timeout():
	$Character.shape.extents = Vector2(39,33)
	$Sprite.play("Idle")
	slide = false
	pass # Replace with function body.

func ganar ():
	get_node("Panel").visible = true

func refill ():
	$Refill.play(0)
	fuel = 100

func _on_Timer_Bala_timeout():
	disparo = false
	pass # Replace with function body.

func _on_DeathTimer_timeout():
	restart()
	pass # Replace with function body.
