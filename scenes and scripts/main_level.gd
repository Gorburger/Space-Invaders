extends Control

@onready var spaceship: CharacterBody2D = $Spaceship
@onready var score_label: Label = $CanvasLayer/score
@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var lives_label: Label = $CanvasLayer/lives
@onready var tile_map: TileMapLayer = $TileMap
@onready var left_wall: StaticBody2D = $LeftWall
@onready var right_wall: StaticBody2D = $RightWall
@onready var win_sound: AudioStreamPlayer2D = $win_sound
@onready var ufo_timer: Timer = $Timer
@onready var ufo_path = preload("res://scenes and scripts/ufo.tscn")
@onready var lose_sound: AudioStreamPlayer2D = $lose_sound

var spaceship_speed: int = 400
var enemy_speed: float = 0.5
var lives: int = 3
var direction: int = 1
var possible_positions: Array[Vector2] = [Vector2(-70, 30), Vector2(1222, 30)]

func _ready() -> void:
	get_tree().set_pause(false)
	ufo_timer.start(randf_range(10, 20))
	Ui.remaining_enemies = tile_map.get_used_cells().size() 
	score_label.text = str(Ui.score)
	lives_label.text = str(Ui.lives)
	
func _physics_process(_delta: float) -> void:
	score_label.text = str(Ui.score)
	lives_label.text = str(Ui.lives)
	spaceship.velocity.x = 0
	if Input.is_action_pressed("ui_left"):
		spaceship.velocity.x = -spaceship_speed
	elif Input.is_action_pressed("ui_right"):
		spaceship.velocity.x = spaceship_speed
	spaceship.move_and_slide()
	
	tile_map.global_position.x += direction * enemy_speed
	if Ui.lives == 0:
		Ui.score = 0
		Ui.lives = 3
		lose_sound.play()
		get_tree().set_pause(true)

	elif Ui.remaining_enemies == 0:
		win_sound.play()
		get_tree().set_pause(true)
		

func _on_win_sound_finished() -> void:
	get_tree().set_pause(false)
	get_tree().reload_current_scene()


func on_LeftWall_enemy_collision(_body: Node2D) -> void:
	direction = 1
	enemy_speed += 0.1
	tile_map.global_position.y += 64
	
func _on_RightWall_enemy_collision(_body: Node2D) -> void:
	direction = -1
	enemy_speed += 0.2
	tile_map.global_position.y += 64


func _on_death_area_body_entered(_body: Node2D) -> void:
	Ui.lives = 0
	Ui.score = 0
	lose_sound.play()
	get_tree().set_pause(true)


func _on_ufo_timer_timeout() -> void:
	var ufo = ufo_path.instantiate()
	add_child(ufo)
	set_ufo_position(ufo)

func set_ufo_position(ufo: CharacterBody2D) -> void:
	var ufo_position: Vector2 = possible_positions.pick_random()
	ufo.global_position = ufo_position
	if ufo_position.x < 0:
		ufo.direction = 1
	else:
		ufo.direction = -1


func _on_lose_sound_finished() -> void:
	get_tree().reload_current_scene()
