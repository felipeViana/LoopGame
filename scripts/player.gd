extends CharacterBody2D

var speed = 300
var gravity = 30
var jump_force = 600
@onready var animation_player=$AnimationPlayer
@onready var sprite=$Sprite2D
var max_speed = 1000

#Handles all of the character physics
func _physics_process(delta: float) -> void:
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	
	if !is_on_floor():
		velocity.y += gravity
		
	if velocity.y >= max_speed:
		velocity.y = max_speed
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y -= jump_force
	
	velocity.x = speed * horizontal_direction
	
	
		
	if horizontal_direction != 0:
		flip_direction(horizontal_direction)

	move_and_slide()
	update_animations(horizontal_direction)
	
#Checks the current state and applies the correct animation
func update_animations(horizontal_direction): 
	if is_on_floor():
		if Input.is_action_just_pressed("attack"):
			animation_player.play("attack")
		else:
			if horizontal_direction != 0:
				animation_player.play("run")
			else:
				animation_player.play("idle")	
	else:
		if velocity.y < 0:
			animation_player.play("Jump")
		else:
			animation_player.play("fall")
		
#checks the direction the player is moving and changes the sprite to face that direction
func flip_direction(horizontal_direction):
	if horizontal_direction == -1:
		sprite.flip_h = true
		sprite.position.x = -4
	elif horizontal_direction == 1:
		sprite.flip_h = false
		sprite.position.x = 4
		
		
