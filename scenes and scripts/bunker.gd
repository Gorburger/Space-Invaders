extends Node2D
@onready var piece_1: Area2D = $piece1
@onready var piece_2: Area2D = $piece2
@onready var piece_3: Area2D = $piece3
@onready var piece_4: Area2D = $piece4
@onready var piece_5: Area2D = $piece5
@onready var piece_6: Area2D = $piece6
@onready var piece_7: Area2D = $piece7
@onready var piece_8: Area2D = $piece8

func _on_piece_1_body_entered(body: Node2D) -> void:
	body.queue_free()
	piece_1.queue_free()

func _on_piece_2_body_entered(body: Node2D) -> void:
	body.queue_free()
	piece_2.queue_free()

func _on_piece_3_body_entered(body: Node2D) -> void:
	body.queue_free()
	piece_3.queue_free()

func _on_piece_4_body_entered(body: Node2D) -> void:
	body.queue_free()
	piece_4.queue_free()

func _on_piece_5_body_entered(body: Node2D) -> void:
	body.queue_free()
	piece_5.queue_free()
	
func _on_piece_6_body_entered(body: Node2D) -> void:
	body.queue_free()
	piece_6.queue_free()

func _on_piece_7_body_entered(body: Node2D) -> void:
	body.queue_free()
	piece_7.queue_free()

func _on_piece_8_body_entered(body: Node2D) -> void:
	body.queue_free()
	piece_8.queue_free()
