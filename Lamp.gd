extends Node3D

var is_on = true

func Interact():
	
	if is_on == false:
		turn_on()
		
	elif is_on == true:
		turn_off()
		
	
	


func turn_on():
	$AudioStreamPlayer3D.play(0.2)
	$OmniLight3D.visible = true
	is_on = true
	


func turn_off():
	$AudioStreamPlayer3D.play(0.2)
	$OmniLight3D.visible = false
	is_on = false
	
