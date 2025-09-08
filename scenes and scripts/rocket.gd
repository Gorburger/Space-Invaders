extends CharacterBody2D

var speed: int = 500
var direction: int = -1
func _physics_process(_delta: float) -> void:
	velocity.y = speed * direction
	move_and_slide()
	var collision_ = get_last_slide_collision()
	if collision_: 
		var collider_ = collision_.get_collider()
		collider_.explode()
		queue_free()


func _on_timer_timeout() -> void:
	queue_free()
