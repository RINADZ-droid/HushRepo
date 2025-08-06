extends Control

@export_file("*.tscn") var next_scene_path:String

func _ready() -> void:
	ResourceLoader.load_threaded_request(next_scene_path)

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	var progress = []
	ResourceLoader.load_threaded_get_status(next_scene_path, progress)
	$Control/State.text = str(snapped(progress[0] * 100, 01)) + "%"
	
	if ResourceLoader.load_threaded_get_status(next_scene_path) == ResourceLoader.THREAD_LOAD_LOADED:
		set_process(false)
		var new_scene: PackedScene = ResourceLoader.load_threaded_get(next_scene_path)
		TransitionScreen.transition()
		await TransitionScreen._on_transition_finished
		get_tree().change_scene_to_packed(new_scene)
