extends Sprite3D

@onready var Character_texture = get_node("/root/World").find_child("Talking Character", true)

func change_tex():
	texture = Character_texture.texture
	
