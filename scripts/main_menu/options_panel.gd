extends Panel

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if GameManager.show_options_panel:
		get_tree().paused = true
		self.visible = true
		$CanvasLayer.visible = true
	else :
		get_tree().paused = false
		self.visible = false
		$CanvasLayer.visible = false
