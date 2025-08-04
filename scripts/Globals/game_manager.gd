extends Node

var show_options_panel:bool
var show_fps:bool
var resolution:int
var can_edit_resolution:bool

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

@warning_ignore("unused_parameter")
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Reload"):
		get_tree().reload_current_scene()
	
	if Input.is_action_just_pressed("Pause") && !show_options_panel:
		show_options_panel = true
	elif Input.is_action_just_pressed("Pause") && show_options_panel:
		show_options_panel = false
