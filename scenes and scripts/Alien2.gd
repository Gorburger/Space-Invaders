extends CharacterBody2D

@onready var rocket_path = preload("res://scenes and scripts/enemy_rocket.tscn")
@onready var rocket_position: Node2D = $RocketPosition
@onready var shoot_timer: Timer = $Timer
@onready var rocket_sound: AudioStreamPlayer2D = $rocket_sound
@onready var death_sound: AudioStreamPlayer2D = $death_sound
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	shoot_timer.start(randf_range(2, 7))

func explode() -> void:
	if not death_sound.playing:
		death_sound.play()
		collision_shape.set_deferred("disbaled", true)


func _on_timer_timeout() -> void:
	var rocket = rocket_path.instantiate()
	get_tree().current_scene.add_child(rocket)
	rocket.global_position = rocket_position.global_position
	rocket_sound.play()
	


func _on_death_sound_finished() -> void:
	Ui.remaining_enemies -= 1
	Ui.score += 30
	queue_free()
