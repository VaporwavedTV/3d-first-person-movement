extends VBoxContainer

@onready var Player_body = get_node("/root/World").find_child("Body", true)
@onready var Player_camera = get_node("/root/World").find_child("Player_camera", true)


func _ready():
	visible = false
	

func _process(_delta):
	if Input.is_action_just_pressed("escape"):
		get_tree().paused = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Player_body.no_move()
		Player_camera.no_move()
		visible = true
		
		
	


func _on_continue_pressed() -> void:
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Player_body.yes_move()
	Player_camera.yes_move()
	visible = false
	
	

func _on_restart_pressed() -> void:
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Player_body.yes_move()
	Player_camera.yes_move()
	visible = false
	get_tree().reload_current_scene()
	

func _on_exit_pressed() -> void:
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Player_body.yes_move()
	Player_camera.yes_move()
	get_tree().quit()
	
	
