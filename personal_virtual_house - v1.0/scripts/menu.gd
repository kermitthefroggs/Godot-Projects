extends Control

@export var viewport : SubViewport

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Menu"):
		var texture = viewport.get_texture()
		

func _on_quit_pressed() -> void:
	get_tree().quit()
