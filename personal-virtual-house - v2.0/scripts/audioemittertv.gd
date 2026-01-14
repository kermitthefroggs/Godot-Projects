extends AudioStreamPlayer3D

@export var player : CharacterBody3D
@export var main : Area3D
@export var outdoors : Area3D
@export var rain_backdoor : AudioStreamPlayer3D
@export var rain_frontdoor : AudioStreamPlayer3D
@export var player_rain : AudioStreamPlayer3D


## - Defunct Code
#func _on_outside_body_entered(body: Node3D) -> void:
	#if body == player:
		#print("baiya!")
		#rain_backdoor.volume_db = -80
		#rain_frontdoor.volume_db = -80
		#player_rain.set_bus("Master")
		#self.set_bus("Muffled")


func _on_house_area_body_entered(body: Node3D) -> void:
	if body == player:
		print("hiya!")
		rain_backdoor.set_bus("Muffled")
		rain_frontdoor.set_bus("Muffled")
		player_rain.set_bus("Muffled")
		self.set_bus("Master")


func _on_house_area_body_exited(body: Node3D) -> void:
	if body == player:
		print("baiya!")
		rain_backdoor.volume_db = -80
		rain_frontdoor.volume_db = -80
		player_rain.set_bus("Master")
		self.set_bus("Muffled")
