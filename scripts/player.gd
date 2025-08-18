extends CharacterBody3D


var SPEED = 3.75
var SPRINT_SPEED = 5.25
const JUMP_VELOCITY = 3.5
const SENSITIVITY = 0.35

var flash_on:bool

var BOB_FREQ = 3.25
var SPRINT_BOB_FREQ = 3.5
const BOB_AMP = 0.075
var t_bob = 0.0


@onready var head: Node3D = $Head
@onready var camera_3d: Camera3D = $Head/Camera3D


func _ready() -> void:
	GameManager.can_edit_resolution = false
	$Head/Camera3D/SpotLight3D.visible = false



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		$AudioStreamPlayer3D.stop()
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_pressed("sprint"):
		$"../CanvasLayer/Label2".visible = false
		$"../CanvasLayer".visible = false
		SPEED = SPRINT_SPEED
		BOB_FREQ = SPRINT_BOB_FREQ
	else :
		SPEED = 3.75
		BOB_FREQ = 3.25
	
	if flash_on:
		$Head/Camera3D/SpotLight3D.visible = true
	elif !flash_on:
		$Head/Camera3D/SpotLight3D.visible = false


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "up", "down")
	var direction := (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		if !$AudioStreamPlayer3D.playing:
			$AudioStreamPlayer3D.play()
	else:
		velocity.x = 0.0
		velocity.z = 0.0
		$AudioStreamPlayer3D.stop()
	
	t_bob += delta * velocity.length() * float(is_on_floor())
	camera_3d.transform.origin = _headbob(t_bob)
	
	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * SENSITIVITY / 100)
		camera_3d.rotate_x(-event.relative.y * SENSITIVITY / 100)
		camera_3d.rotation.x = clamp(camera_3d.rotation.x, deg_to_rad(-90), deg_to_rad(45))
	if Input.is_action_just_pressed("Pause"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else :
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if Input.is_action_just_pressed("flash"):
		$"../CanvasLayer/Label".visible = false
		$"../CanvasLayer/Label2".visible = true
		if flash_on:
			flash_on = false
		elif !flash_on:
			flash_on = true

@warning_ignore("unused_parameter")
func _headbob(time):
	var pos = Vector3.ZERO
	pos.y = sin(t_bob * BOB_FREQ) * BOB_AMP
	return pos
