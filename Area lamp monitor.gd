extends Area3D


@onready var Lamp = get_node("/root/World").find_child("Lamp", true)
var lamp_is_here = false



func _on_body_entered(body: Node3D) -> void:
	if body == Lamp:
		lamp_is_here = true
		
	
