extends CharacterBody2D

var health = 1
@onready var player = get_node("/root/Game/Player")

func _ready():
	%cat.play_walkcat_animation()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 200
	move_and_slide()
	
	
func take_damage():
	health -= 1
	
	if health == 0:
		queue_free()
		
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
