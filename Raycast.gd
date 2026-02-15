extends RayCast3D

@onready var reticle_text = $"../../Reticle text"
@onready var hand_position = $"../../Hand_position"
@onready var drop_position = $Drop_position
@onready var dropping_raycast = $dropping_raycast
var focused_object = null
var mouse_vis
var mouse_invis
var grabbed_object = null
var no_second_interact = false


func _ready():
	$"../../Think Talk".visible = false
	

func _process(_delta):
	drop_position.global_rotation = Vector3(1.57,0,0)
	
	if dropping_raycast.get_collider() == null:
		if Input.is_action_just_pressed("LMB") and grabbed_object != null:
			grabbed_object.global_position = drop_position.global_position
			grabbed_object.freeze = false
			grabbed_object = null
			
		
	
	
	
	no_second_interact = false
	
	
	
	if get_collider() != null and focused_object == null and grabbed_object == null:
		
		if get_collider().is_in_group("Interactable"):
			
			reticle_text.visible = true
			reticle_text.text = "Press E to Interact"
			 
			if Input.is_action_just_pressed("E"):
				
				get_collider().Interact()
				no_second_interact = true
				
			
		
		else:
			reticle_text.visible = false
			
		
		if get_collider().is_in_group("Has_Name"):
			if get_collider().object_name:
				reticle_text.visible = true
				reticle_text.text = str(get_collider().object_name)
				
			
		
		
		
		if get_collider().is_in_group("3d_options"):
			if Input.is_action_just_pressed("LMB"):
				get_collider().get_child(0).get_child(0).get_child(3).focused = true
				focused_object = get_collider()
				
			
		
		
		if Input.is_action_just_pressed("LMB"):
			if grabbed_object == null and get_collider() and get_collider().is_in_group("grab"):
				grabbed_object = get_collider()
				grabbed_object.freeze = true
				
			
		
	else:
		reticle_text.visible = false
		
	
	
	if grabbed_object != null:
		grabbed_an_object()
		
	
	
	
	if focused_object != null:
		if focused_object.get("Identity") and focused_object.Identity != null:
			$"../../Think Talk/Name Plate/Name".text = str(focused_object.Identity)
		if Input.is_action_just_pressed("E") or Input.is_action_just_pressed("ui_accept"):
			if no_second_interact == false:
				focused_object.Interact()
				
			
		
		
		
		
	
	
	
	
	
	
	


func _on_no_button_pressed() -> void:
	if focused_object != null:
		focused_object.Answer_no = true
		focused_object.Interact()
		focused_object.Answer_no = false
		
	



func _on_yes_button_pressed() -> void:
	if focused_object != null:
		focused_object.Answer_yes = true
		focused_object.Interact()
		focused_object.Answer_yes = false
	

func grabbed_an_object():
	
	grabbed_object.global_position = hand_position.global_position
	grabbed_object.global_rotation = hand_position.global_rotation
	
	
	
	
