extends AudioStreamPlayer3D

@export var player : CharacterBody3D
@export var main : Area3D
@export var outdoors : Area3D
@export var volume_slider : HSlider

## - TO DO: FIX THIS CODE!!!! FOR SOME REASON THE AUDIO BUSES DO NOT EFFECT THE AUDIO IT SEEMS, AND WHEN IT IS AFFECTED IT HAS THIS ANNOYING CRACKLE.

 #Resets the audio bus to be undisturbed
#func _on_main_room_body_entered(body: Node3D) -> void:
	#if body == player:
		#set_bus("Master")

 #Checks if player enters room, changes audio bus to be more muffled
#func _on_bedroom_body_entered(body: Node3D) -> void:
	#if body == player:
		#print("yes!!")
		#set_bus("Outside")


func _on_volume_slider_changed() -> void:
	volume_db = volume_slider.value * -1.0
