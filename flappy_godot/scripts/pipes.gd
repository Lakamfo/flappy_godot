tool
extends KinematicBody2D

var direction = Vector2.LEFT * 200
var score_gived = false

func _physics_process(delta: float) -> void:
	move_and_slide(direction)
	if position.x < -20 and not score_gived:
		get_parent().score += 1
		score_gived = true
	if position.x < -800:
		get_parent().pipes_array.erase(self)
		queue_free()

func _on_die_area_body_entered(body: Node) -> void:
	body.game._reset()
