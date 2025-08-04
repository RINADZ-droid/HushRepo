extends CanvasLayer

func _ready() -> void:
	pass # Replace with function body.

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if GameManager.show_fps:
		$Label.text ="FPS: " + str(Engine.get_frames_per_second())
	else :
		$Label.text = ""
