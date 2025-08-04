extends Node

func _on_back_button_pressed() -> void:
	GameManager.show_options_panel = false

func _on_main_menu_button_pressed() -> void:
	GameManager.show_options_panel = false
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
