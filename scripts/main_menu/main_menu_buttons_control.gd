extends Node

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	GameManager.can_edit_resolution = true

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if GameManager.show_options_panel:
		$"..".visible = false
		$"../../GameTitle".visible = false
	else :
		$"..".visible = true
		$"../../GameTitle".visible = true

func _on_start_button_pressed() -> void:
	TransitionScreen.transition()
	await TransitionScreen._on_transition_finished
	get_tree().change_scene_to_file("res://test.tscn")


func _on_options_button_pressed() -> void:
	GameManager.show_options_panel = true


func _on_exit_button_pressed() -> void:
	get_tree().quit()
