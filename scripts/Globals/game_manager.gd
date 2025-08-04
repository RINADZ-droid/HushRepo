extends Node

var show_options_panel
var show_fps

@warning_ignore("unused_parameter")
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Pause") && !show_options_panel:
		show_options_panel = true
	elif Input.is_action_just_pressed("Pause") && show_options_panel:
		show_options_panel = false
