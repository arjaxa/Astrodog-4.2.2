extends CharacterBody2D

signal health_depleted

var health = 100.0

func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * 600
	move_and_slide()
	
	if velocity.length() > 0.0:
		%Dog.play_walk_animation()
	else:
		%Dog.play_idle_animation()
	const DAMAGE_RATE = 5.0
	var overlaping_enemies = %HurtBox.get_overlapping_bodies()
	if overlaping_enemies.size() > 0:
		health -= DAMAGE_RATE * overlaping_enemies.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()
