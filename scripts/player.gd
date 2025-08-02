extends CharacterBody2D

var speed = 300
var gravity = 30
var jump_force = 600
@onready var animation_player=$AnimationPlayer
@onready var sprite=$Sprite2D
var max_speed = 1000

func _physics_process(delta: float) -> void:
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	
	if !is_on_floor():
		velocity.y += gravity
		
	if velocity.y >= max_speed:
		velocity.y = max_speed
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y -= jump_force
	
	velocity.x = speed * horizontal_direction
	
	move_and_slide()
	update_animations()
	
	
func update_animations():
	if velocity.y<0:
		animation_player.play("Jump")
	else:
		animation_player.play("idle")
	
