extends Panel

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if GameManager.show_options_panel:
		self.visible = true
		$CanvasLayer.visible = true
	else :
		self.visible = false
		$CanvasLayer.visible = false
