extends CharacterBody3D


func _physics_process(delta):
	
	rotation.y = lerp_angle(rotation.y, $"../Node3D2".rotation.y + 3.1, 6 * delta)
	
	
	
	
