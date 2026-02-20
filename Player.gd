extends CharacterBody3D

const JUMP_VELOCITY = 6
var speed = 4
var gravity = 9.8
var moving = false
var in_air = false
var is_running = false
var can_run = true
var stamina_drain = 0.25
var stamina_draining = false
var has_flashlight = true
@onready var flashlight = $"../head/Player_camera/Flashlight"
@onready var stamina_bar = $"../head/Stamina Bar"
@onready var anim_player = $"../AnimationPlayer"
@onready var ui_anim_player = $"../UI_AnimationPlayer"
@onready var crouching = $".."
@onready var crouching_raycast = $"../head/Player_camera/Player_raycast/crouching_raycast"


func _physics_process(delta):
	crouching_raycast.global_rotation = Vector3(0,3.145,3.145)
	
	if is_on_floor():
		if in_air == true:
			anim_player.play("Jump_land")
			in_air = false
			
		
	
	if not is_on_floor():
		in_air = true
		velocity.y -= gravity * delta
		
	
	
	
	if stamina_draining == true and not in_air:
		if stamina_bar.visible == false:
			ui_anim_player.play("stamina_appear")
		stamina_bar.value -= stamina_drain
		stamina_bar.value = clamp(stamina_bar.value, 0, 100)
	elif not in_air:
		stamina_bar.value += stamina_drain
		
	if stamina_bar.value >= 100 and stamina_draining == false:
		if stamina_bar.visible == true:
			ui_anim_player.play("stamina_fade")
		
	
	if Input.is_action_pressed("run") and is_on_floor() and crouching.crouch_height == 0 and can_run == true:
		speed = 8
		if speed == 8 and moving == true:
			is_running = true
			stamina_draining = true
			
		
	elif Input.is_action_just_released("run") or stamina_bar.value <= 0 and is_on_floor():
		speed = 4
		if speed < 8:
			is_running = false
			stamina_draining = false
			
		
	
	if Input.is_action_pressed("run") and stamina_bar.value <= 0 and is_on_floor():
		can_run = false
	elif Input.is_action_just_released("run") or stamina_bar.value >= 50:
		can_run = true
	
	if Input.is_action_just_released("run") and not is_on_floor() and is_running == true:
		stamina_draining = false
		speed = 8
		
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		if not Input.is_action_pressed("crouch"):
			anim_player.play("Jump_land")
		velocity.y = JUMP_VELOCITY
		stamina_bar.value -= 10
		
	
	if Input.is_action_pressed("crouch") and is_on_floor():
		stamina_draining = false
		crouching.crouch_height = 1
		$"Body collision".disabled = true
		speed = 2
		
	elif crouching_raycast.get_collider() == null and is_on_floor():
		crouching.crouch_height = 0
		$"Body collision".disabled = false
		if not Input.is_action_pressed("run"):
			speed = 4
		
	elif crouching_raycast.get_collider() != null and is_on_floor():
		speed = 2
		
	
	
	if Input.is_action_pressed("P"):
		velocity.y = 10
		
	
	
	var input_dir = Input.get_vector("left", "right", "up", "back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		moving = true
		
		
		
		
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
		moving = false
		
	
	if has_flashlight == true and Input.is_action_just_pressed("F"):
		if flashlight.visible == false:
			flashlight.visible = true
		else:
			flashlight.visible = false
		
	
	
	
	
	move_and_slide()
	


func no_move():
	axis_lock_linear_x = true
	axis_lock_linear_y = true
	axis_lock_linear_z = true
	

func yes_move():
	axis_lock_linear_x = false
	axis_lock_linear_y = false
	axis_lock_linear_z = false
	
