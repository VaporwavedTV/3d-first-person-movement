extends CharacterBody3D

var object_name = "Alternate"
var gravity = 9.8
var speed = 5
var moving = false
@onready var Player_body = get_node("/root/World").find_child("Body", true)



func _process(delta):
	
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	
	
	look_at(Player_body.global_position)
	self.rotation.x = 0
	
	if Input.is_action_just_pressed("M"):
		if moving == false:
			moving = true
		else:
			moving = false
			
		
	
	
	
	
	if moving == true:
		velocity = -transform.basis.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
		
	
	
	move_and_slide()
	
