extends CanvasLayer

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if GameManager.show_fps:
		$Label.visible = true
		$Label.text ="FPS: " + str(snapped(Engine.get_frames_per_second(),1))
	else :
		$Label.visible = false
