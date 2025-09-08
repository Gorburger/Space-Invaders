extends CharacterBody2D

var rocket_path = preload("res://scenes and scripts/rocket.tscn")
@onready var rocket_position: Node2D = $RocketPosition
@onready var life_lost_sound: AudioStreamPlayer2D = $LifeLostSound
@onready var rocket_sound: AudioStreamPlayer2D = $rocket

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		rocket_sound.play()
		var rocket = rocket_path.instantiate()
		get_tree().current_scene.add_child(rocket)
		rocket.global_position =  rocket_position.global_position


func explode():
	life_lost_sound.play()
	Ui.lives -= 1
