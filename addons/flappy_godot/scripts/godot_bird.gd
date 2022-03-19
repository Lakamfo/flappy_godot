tool
extends KinematicBody2D

onready var tween = $tween
onready var sprite = $Godot
onready var jump_time = $time_jump
onready var game = get_parent()
var direction = Vector2()

func _jump_pressed() -> void:
	direction = Vector2.UP * 300
	tween.interpolate_property(sprite,"rotation_degrees",sprite.rotation_degrees + 10,-20,0.2,Tween.TRANS_SINE)
	tween.start()
	jump_time.start(0.2)

func _physics_process(delta: float) -> void:
	move_and_slide(direction)
	for i in get_slide_count():
		var collisions = get_slide_collision(0)
		if collisions:
			game._reset()

func _time_jump_timeout() -> void:
	direction = Vector2.DOWN * 300
	tween.interpolate_property(sprite,"rotation_degrees",sprite.rotation_degrees - 10,20,0.2,Tween.TRANS_SINE)
	tween.start()
