extends ColorRect

var sens = 1
var karen = false
var option = null
var option_speed = 2
var focused = false




func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.is_action_pressed("LMB") and focused:
		position.x += (event.relative.x * sens)
		position.y += (event.relative.y * sens)
		position.x = clamp(position.x, -800, 760)
		position.y = clamp(position.y, -450, 410)
		
	else:
		position.x = 0
		position.y = 0
		
	

func _process(_delta):
	if karen == true:
		option.value += option_speed
		
	



func _on_area_2d_area_entered(area: Area2D) -> void:
	option = area.get_child(1)
	karen = true
func _on_area_2d_area_exited(area: Area2D) -> void:
	area.get_child(1).value = 0
	option = null
	karen = false
	
