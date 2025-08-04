extends Node


func _on_start_button_pressed() -> void:
	pass # Replace with function body.


func _on_options_button_pressed() -> void:
	GameManager.show_options_panel = true


func _on_exit_button_pressed() -> void:
	get_tree().quit()
