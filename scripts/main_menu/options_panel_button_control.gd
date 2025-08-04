extends Node

func _ready() -> void:
	$"../CanvasLayer/OptionsPanelElements/WindowModeOptionButton".select(2)
	$"../CanvasLayer/OptionsPanelElements/VsyncModeOptionButton".select(1)
func _on_back_button_pressed() -> void:
	GameManager.show_options_panel = false

func _on_main_menu_button_pressed() -> void:
	GameManager.show_options_panel = false
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")

func _on_check_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		GameManager.show_fps = true
	else :
		GameManager.show_fps = false

func _on_window_mode_option_button_item_selected(index: int) -> void:
	match index:
		0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
		1:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		2:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		3:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)

func _on_vsync_mode_option_button_item_selected(index: int) -> void:
	match index:
		0:
			DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		1:
			DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
		2:
			DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ADAPTIVE)
		3:
			DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_MAILBOX)
