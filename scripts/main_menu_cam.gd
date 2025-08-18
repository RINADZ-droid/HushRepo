extends Camera3D


func _process(delta: float) -> void:
	rotation.y += 0.1  * delta
