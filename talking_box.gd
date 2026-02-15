extends RichTextLabel

var textime = 0
var animating = false
@onready var previous_text = text
@onready var player = get_node("/root/World").find_child("player", true)







func _process(_delta):
	
	
	
	visible_characters = textime
	
	if animating == true:
		textime += 0.5
		if Input.is_action_just_pressed("E") or Input.is_action_just_pressed("ui_accept"):
			if visible_characters >= 0.2:
				textime = text.length()
				
			
		
	
	
	if visible_characters == text.length():
		
		animating = false
		previous_text = text
		
	
	
	
	
	
	
	
	
	
	
	


func show_text(new_text: String):
	
	
	
	text = new_text
	textime = 0
	animating = true
	
