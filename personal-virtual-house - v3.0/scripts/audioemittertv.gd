extends Node3D

# Setting up the various variables
@export var player : CharacterBody3D
@export var house_area : Area3D
@export var outdoors_area : Area3D
@export var music : AudioStreamPlayer3D
@export var rain_backdoor : AudioStreamPlayer3D
@export var rain_frontdoor : AudioStreamPlayer3D
@export var rain_window : AudioStreamPlayer3D
@export var player_rain : AudioStreamPlayer3D
@export var rain_vfx : CPUParticles3D


## - Defunct Code
#func _on_outside_body_entered(body: Node3D) -> void:
	#if body == player:
		#print("baiya!")
		#rain_backdoor.volume_db = -80
		#rain_frontdoor.volume_db = -80
		#player_rain.set_bus("Master")
		#self.set_bus("Muffled")

## - Code checks if player enters the house and changes various elements
func _on_house_area_body_entered(body: Node3D) -> void:
	# Cheeky if statement to make sure 
	# it isn't just the house itself spawning in
	if body == player:
		# If the volume of the audio emitters have been changed, 
		# it resets them to their standard volume
		rain_backdoor.volume_db = -15
		rain_frontdoor.volume_db = -15
		rain_window.volume_db = -15
		player_rain.volume_db = -20
		
		# Changes the various rain sounds to be muffled
		rain_backdoor.set_bus("Muffled")
		rain_frontdoor.set_bus("Muffled")
		player_rain.set_bus("Muffled")
		# And the music to be standard audio quality
		music.set_bus("Master")
		
		# Also makes the rain invisible to prevent clipping
		rain_vfx.visible = false


func _on_house_area_body_exited(body: Node3D) -> void:
	# Another cheeky if statement to make sure 
	# it is the player who left the house
	if body == player:
		# Decreases the rain volume at the doors, window, and player
		# to be completely inaudible, to prevent the audio playing twice 
		# (as the player also has their own personal rain sounds)
		rain_backdoor.volume_db = -80
		rain_frontdoor.volume_db = -80
		rain_window.volume_db = -80
		player_rain.volume_db = -15
		
		# Changes player rain to be not muffled and the music to be muffled
		player_rain.set_bus("Master")
		music.set_bus("Muffled")
		
		# Shows rain again
		## - Todo: 
		# There is some delay between the player stepping outside
		# and the rain being visible, might be something I need to fix
		# but it is also pretty minor of a bug.
		rain_vfx.visible = true


func _on_bedroom_window_body_entered(body: Node3D) -> void:
	if body == player:
		rain_vfx.visible = true


func _on_bedroom_window_body_exited(body: Node3D) -> void:
	if body == player:
		rain_vfx.visible = false
