extends Node2D

@onready var boss_door = $BossDoor
@onready var player = $Player
@onready var startingPosition = $StartingPosition
@onready var teleportPosition = $TeleportPosition

var boss_dead = false
var door_blocking = true

func _process(delta: float) -> void:
	if boss_dead && door_blocking:
		# open path
		boss_door.translate(Vector2(0, 1000))
		door_blocking = false
		
	if player.position.x >= teleportPosition.position.x:
		# teleport player
		player.position.x = startingPosition.position.x
		player.position.y -= 32
		
		# blocks path
		boss_dead = false
		door_blocking = true
		boss_door.translate(Vector2(0, -1000))
