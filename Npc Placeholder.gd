extends CharacterBody3D

@onready var Think_talk = get_node("/root/World").find_child("Think Talk", true)
@onready var Talker = get_node("/root/World").find_child("Talking Box", true)
@onready var Player = get_node("/root/World").find_child("Player", true)
@onready var Player_body = get_node("/root/World").find_child("Body", true)
@onready var Player_camera = get_node("/root/World").find_child("Player_camera", true)
@onready var Player_raycast = get_node("/root/World").find_child("Player_raycast", true)
@onready var Talk_anim_player = get_node("/root/World").find_child("Talk_anim_player", true)
@onready var No_button = get_node("/root/World").find_child("No_Button", true)
@onready var Yes_button = get_node("/root/World").find_child("Yes_Button", true)
@onready var Character_texture = get_node("/root/World").find_child("Talking Character", true)
@onready var Lamp_finder = get_node("/root/World").find_child("Lamp finder", true)
@onready var Lamp = get_node("/root/World").find_child("Lamp", true)
@onready var video_player = get_node("/root/World").find_child("Spooky scary skeletons", true)
@onready var Answer_no = false
@onready var Answer_yes = false
var line_number = 0
var Identity = "Edwardo" 
var choosing = false



func Interact():
	
	
	if Talker.animating == true:
		return
		
	
	if not choosing:
		line_number += 1
		
	
	
	
	
	
	Think_talk.visible = true
	Player_camera.no_move()
	Player_body.no_move()
	Player_raycast.focused_object = self
	Player.look_at_object(self)
	
	
	
	
	
	if line_number == 1:
		Talker.show_text("...")
		Character_texture.texture = load("res://yo yo yo sumilo 1 norm.png")
	if line_number == 2:
		Talker.show_text("Ahem... Hey..")
		play_voice_line("res://voice lines for game(BAD)/Line 2.mp3")
	if line_number == 3:
		position_choice_normal()
		choice_time()
		No_button.text = "Um"
		Yes_button.text = "Are you okay?"
		if Answer_no == true:
			Talker.show_text("What?")
			position_choice_only_one()
			play_voice_line("res://voice lines for game(BAD)/Line 3 no res.mp3")
			
		if Answer_yes == true:
			Talker.show_text("No I'm not okay! Don't you see all this blood that just appeared on me!") 
			Character_texture.texture = load("res://yo yo yo sumilo 2 blood.png")
			play_voice_line("res://voice lines for game(BAD)/Line 3 yes res.mp3")
			choice_over()
			
	if line_number == 4:
		Talker.show_text("Dude.")
		play_voice_line("res://voice lines for game(BAD)/Line 4.mp3")
	if line_number == 5:
		Talker.show_text("Like?")
		play_voice_line("res://voice lines for game(BAD)/Line 5.mp3")
	if line_number == 6:
		Talker.show_text("Ugh")
		play_voice_line("res://voice lines for game(BAD)/Line 6.mp3")
	if line_number == 7:
		conversation_over()
		
	if line_number == 8:
		Talker.show_text("What!")
		choice_time()
		position_choice_only_one()
		Yes_button.text = "Can I help at all?"
		if Answer_yes == true:
			Talker.show_text("Oh, I uh... I guess that would be nice.")
			choice_over()
			
	if line_number == 9:
		Talker.show_text("Can you move that lamp onto the table over there?")
		Player.look_at_object(Lamp)
		
	if line_number == 10:
		Talker.show_text("Hm?")
		choice_time()
		position_choice_normal()
		No_button.text = "Sure."
		Yes_button.text = "I meant help with the blood."
		if Answer_no == true:
			Talker.show_text("Thank you.")
			Player.stop_looking()
			choice_over()
		if Answer_yes == true:
			Talker.show_text("Nah, I'll be fine. Just help me with this for now.")
			Player.stop_looking()
			choice_over()
			
	if line_number == 11:
		Talker.show_text("I'll stay here for now.")
	if line_number == 12:
		Talker.show_text("Not like I have much choice...")
	if line_number == 13:
		conversation_over()
		
	if line_number == 14 and Lamp_finder.lamp_is_here == true:
		line_number += 3
		
	if line_number == 14:
		Talker.show_text("Thank you for helping me.")
	if line_number == 15:
		Talker.show_text("It is appreciated.")
	if line_number == 16:
		line_number -= 3
		conversation_over()
		
	if line_number == 17:
		Talker.show_text("da da da daba deba da- oh... hi.")
	if line_number == 18:
		Talker.show_text("Oh look! you did it, My hero.")
	if line_number == 19:
		Talker.show_text("Putting lamps on tables, next thing you know you'll become the president.")
	if line_number == 20:
		Talker.show_text("But like... a good one, you know.")
	if line_number == 21:
		Talker.show_text("Apparently you were so good at it that I miraculously healed all my wounds.")
		Character_texture.texture = load("res://yo yo yo sumilo 1 norm.png")
	if line_number == 22:
		Talker.show_text("Thanks I guess.")
	if line_number == 23:
		choice_time()
		position_choice_normal()
		No_button.text = "I'm always happy to help!"
		Yes_button.text = "Do I get a reward?"
		if Answer_no == true:
			Talker.show_text("I'm sure you are.")
			choice_over()
			
		if Answer_yes == true:
			Talker.show_text("Fine, I guess you should earn something after all this.")
			line_number += 2
			choice_over()
			
	if line_number == 24:
		conversation_over()
		
	if line_number == 25:
		Talker.show_text("Is everything okay?")
		choice_time()
		position_choice_only_one()
		if Answer_yes == true:
			Talker.show_text("Fine, I guess you should earn something after all this.")
			choice_over()
			
	if line_number == 26:
		Talker.show_text("Reward in 3... 2... 1...")
	if line_number == 27:
		if video_player.playing == false:
			video_player.play()
		Talker.show_text("Enjoy yourself.")
	if line_number == 28:
		conversation_over()
		line_number -= 2
		
	
	
	
	$"../RichTextLabel".text = str(line_number)
	
	$"../Sprite3D".texture = Character_texture.texture
	
	

func choice_time():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	choosing = true
	No_button.visible = true
	Yes_button.visible = true
	

func choice_over():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	choosing = false
	No_button.visible = false
	Yes_button.visible = false
	

func position_choice_normal():
	No_button.size.x = 515
	No_button.position.x = 16
	Yes_button.size.x = 515
	Yes_button.position.x = 573
	

func position_choice_only_one():
	No_button.visible = false
	Yes_button.visible = true
	Yes_button.size.x = 1000
	Yes_button.position.x = 50
	

func conversation_over():
	Player_camera.yes_move()
	Player_body.yes_move()
	Player_raycast.focused_object = null
	Player.stop_looking()
	Think_talk.visible = false
	

func play_voice_line(clip: String):
	$AudioStreamPlayer3D.stream = load(clip)
	$AudioStreamPlayer3D.play()
	
