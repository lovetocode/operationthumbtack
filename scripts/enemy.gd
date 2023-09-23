class_name  Enemy extends Area2D

var speed = 150

@export var hp = 1

func _physics_process(delta):
	global_position.y += speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	
func die():
	queue_free()
	
func _on_body_entered(body):
	if body is player:
		body.die()
		die()
		
func take_damage(amount):
	hp -= amount
	if hp <= 0:
		die()
	
	
