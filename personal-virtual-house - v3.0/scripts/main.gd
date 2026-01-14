extends Node3D

@export var poster : MeshInstance3D
@export var material : StandardMaterial3D
@export var p1 : CompressedTexture2D = preload("uid://cymditlxe3y3q")
@export var p2 : CompressedTexture2D = preload("uid://fpf1t0ltp1hv")
@export var p3 : CompressedTexture2D = preload("uid://cbthgpt75ijwt")
@export var p4 : CompressedTexture2D = preload("uid://bc8rpyguxq2a")
@export var p5 : CompressedTexture2D = preload("uid://cf8pqjikmqkqc")
var images_array : Array[CompressedTexture2D]

## Come back to later
#@export var moving_sky_portal : MeshInstance3D

@export var player_raycast : RayCast3D
@export var radio_music : AudioStreamPlayer3D


func _ready() -> void:
	images_array.append(p1)
	images_array.append(p2)
	images_array.append(p3)
	images_array.append(p4)
	images_array.append(p5)

func _process(_delta: float) -> void: 
	if Input.is_action_pressed("image"):
		var new_image = images_array.pick_random()
		material.albedo_texture = new_image
		poster.material_override = material

	if player_raycast.is_colliding() && Input.is_action_just_pressed("radio_mute"):
		if radio_music.volume_db == -20:
			radio_music.volume_db = -80
		
		else:
			radio_music.volume_db = -20
