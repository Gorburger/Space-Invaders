extends CharacterBody2D

@onready var death_sound: AudioStreamPlayer2D = $death_sound

var direction : int = 0
var speed: int = 200
var possible_scores: Array[int] = [50, 100, 150, 200, 250, 300]

func explode() -> void:
	if not death_sound.playing:
		speed = 0
		death_sound.play()
		Ui.score += possible_scores.pick_random()

func _physics_process(_delta: float) -> void:
	velocity.x = direction * speed
	move_and_slide()


func _on_timer_timeout() -> void:
	queue_free()

func _on_death_sound_finished() -> void:
	queue_free()
