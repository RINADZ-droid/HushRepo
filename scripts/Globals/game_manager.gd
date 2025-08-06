extends Node

var show_options_panel:bool
var show_fps:bool
var can_edit_resolution:bool
var lang:String

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

@warning_ignore("unused_parameter")
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Reload"):
		get_tree().change_scene_to_file("res://scenes/loading_screen.tscn")
	
	if Input.is_action_just_pressed("Pause") && !show_options_panel:
		show_options_panel = true
	elif Input.is_action_just_pressed("Pause") && show_options_panel:
		show_options_panel = false
