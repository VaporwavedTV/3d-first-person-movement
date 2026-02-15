extends Node3D

var move_rate = 5
@onready var head_pos = $Body/Head_pos
@onready var head = $head
@onready var camera = $head/Player_camera
@onready var body = $Body
@onready var looking_at_thing = $looking_at_thing
@onready var eyes = $eyes
var crouch_height = 0
var looking_at_something = false



func _process(delta):
	var move_head = head_pos.global_position
	move_head.y = head_pos.global_position.y - crouch_height
	
	move_rate = head.global_position.distance_to(move_head) * 8 + 0.05
	
	head.global_position = head.global_position.move_toward(move_head, move_rate * delta)
	
	eyes.global_position = head.global_position
	if looking_at_something == true:
		
		eyes.look_at(looking_at_thing.global_position)
		body.rotation.y = lerp_angle(body.rotation.y, eyes.rotation.y, 6 * delta)
		head.rotation.y = lerp_angle(head.rotation.y, eyes.rotation.y, 6 * delta)
		camera.rotation.x = lerp_angle(camera.rotation.x, eyes.rotation.x, 6 * delta)
		
	

func look_at_object(object_look: Node):
	looking_at_something = true
	looking_at_thing.global_position = object_look.global_position
	

func stop_looking():
	looking_at_something = false
	
