tool
extends EditorPlugin

var game_instance

func _enter_tree() -> void:
	game_instance = preload("res://addons/flappy_godot/game.tscn").instance()
	add_control_to_dock(DOCK_SLOT_RIGHT_UL,game_instance)

func _exit_tree() -> void:
	game_instance.free()
