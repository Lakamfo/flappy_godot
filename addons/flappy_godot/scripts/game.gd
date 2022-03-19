tool
extends Node2D

var _started = false
var score = 0
var pipes_array = []
onready var pipes = preload("res://addons/flappy_godot/res/pipes.tscn")
onready var godot_bird = $godot_bird
onready var score_label = $"../../Label"
onready var _timer = $add_pipes

func _ready() -> void:
	randomize()

func _process(delta: float) -> void:
	if score_label:
		score_label.text = "Score:" +str(score)
	if godot_bird.position.y > 275:
		_reset()
	elif godot_bird.position.y < -275:
		_reset()

func _reset():
	godot_bird.position.y = 0
	godot_bird.direction = Vector2()
	score = 0
	godot_bird.sprite.rotation_degrees = 0
	_timer.stop()
	for i in pipes_array:
		if i != null:
			i.queue_free()
	pipes_array.clear()
	_started = false

func _on_add_pipes_timeout() -> void:
	var pipes_instance = pipes.instance()
	pipes_array.push_back(pipes_instance)
	print(pipes_array)
	pipes_instance.position.x = 600
	pipes_instance.position.y = rand_range(-150,150)
	add_child(pipes_instance)

func _on_ToolButton_pressed() -> void:
	if not _started:
		_started = true
		_timer.start(2)
