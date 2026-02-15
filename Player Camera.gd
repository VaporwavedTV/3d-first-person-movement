extends Node3D

var sens = 0.005
var mouse_move = true
@onready var body = $"../../Body"

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and mouse_move:
		body.rotate_y(-event.relative.x * sens)
		get_parent().rotate_y(-event.relative.x * sens)
		rotate_x(-event.relative.y * sens)
		rotation.x = clamp(rotation.x, deg_to_rad(-90), deg_to_rad(90))
		
	

func no_move():
	mouse_move = false
	

func yes_move():
	mouse_move = true
	
