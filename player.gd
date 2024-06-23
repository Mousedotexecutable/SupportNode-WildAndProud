extends CharacterBody2D

@export var Tilemap: TileMap
@export var MusicVolume: int

@onready var BushSetOnFireSound = $SoundEffects/BushSetOnFire
@onready var EnterWaterSound = $SoundEffects/EnterWater
@onready var InteractSound = $SoundEffects/Interact
@onready var PresentCollectSound = $SoundEffects/PresentCollect
@onready var PushBlockSound = $SoundEffects/PushBlock

@onready var MusicMelody = $Music/MusicMelody
@onready var MusicBass = $Music/MusicBass
@onready var MusicHarmony = $Music/MusicHarmony
@onready var MusicPercussion = $Music/MusicPercussion

var interaction_mode :bool = false
var input_delay_timer :float = 0.0

func _ready():
	Global.textbox_finished.connect(_on_textbox_has_finished)
	Global.enable_raft.connect(_on_raft_has_been_enabled)
	
	MusicMelody.volume_db = MusicVolume

func _physics_process(delta):
	match(interaction_mode):
		false:
			input_delay_timer -= 1 * delta
			player_update(delta)
			



func player_update(delta):
	
	var input_dirrection :Vector2 =  Vector2( Input.get_action_strength("right") - Input.get_action_strength("left"), Input.get_action_strength("down") - Input.get_action_strength("up") )
	input_dirrection = input_dirrection.normalized()
	
	velocity = velocity.lerp( input_dirrection * 25, 10.0 * delta)
	
	if input_dirrection.x != 0:
		$Sprite2D.flip_h = true if input_dirrection.x > 0 else false
	
	if(Global.Glove and (MusicBass.volume_db == 0)):
		MusicBass.volume_db = MusicVolume
	if(Global.Fire and (MusicHarmony.volume_db == 0)):
		MusicHarmony.volume_db = MusicVolume
	if(Global.Raft and (MusicPercussion.volume_db == 0)):
		MusicPercussion.volume_db = MusicVolume
	move_and_slide()
	
	#When Raft is True disable mask 6 collision
	#Check for Raft
	if(Global.Raft):
		#Tilemap data = null = Ground, Tilemap data != null = water
		if(Tilemap.get_cell_tile_data(0, Tilemap.local_to_map(position)) != null):
			if(not $RaftSprite.visible):
				print("playing")
				EnterWaterSound.play()
				$RaftSprite.show()
				$Sprite2D.hide()
		else:
			if($RaftSprite.visible):
				print("playing")
				EnterWaterSound.play()
				$Sprite2D.show()
				$RaftSprite.hide()
	
	# Sorry for the mess, but I had to make the game feel responsive and this was the only the player would have never been able to use the interact button properly.
	
	for i in $Area2D.get_overlapping_bodies():
		if i.has_method("Burn"):
			if(Global.Fire):
				if Input.is_action_just_pressed("interact"):
					BushSetOnFireSound.play()
					i.Burn()
	
	for i in $Area2D.get_overlapping_areas():
		if input_delay_timer < 0:
			if i.has_method("friend_interact"):
				if Input.is_action_just_pressed("interact"):
					InteractSound.play()
					i.friend_interact()
					interaction_mode = true
					input_delay_timer = 0.2
					
					#if Global.gift_ammount > 0:
						
			elif i.has_method("level_exit_interact"):
				if Input.is_action_just_pressed("interact"):
					InteractSound.play()
					i.level_exit_interact()
					interaction_mode = true
					input_delay_timer = 0.2
				
		if i.has_method("pickup_gift"):
			PresentCollectSound.play()
			i.pickup_gift()
	
	
			

func _on_area_2d_body_entered(body):
	if(body.has_method("Push")):
		if(Global.Glove):
			var PlayerTile = Tilemap.map_to_local(Tilemap.local_to_map(position))
			var BoxTile = Tilemap.map_to_local(Tilemap.local_to_map(body.position))
			if(PlayerTile.x == BoxTile.x):
				if(PlayerTile.y > BoxTile.y):
					PushBlockSound.play()
					body.Push("Up")
				else:
					PushBlockSound.play()
					body.Push("Down")
			elif(PlayerTile.y == BoxTile.y):
				if(PlayerTile.x > BoxTile.x):
					PushBlockSound.play()
					body.Push("Left")
				else:
					PushBlockSound.play()
					body.Push("Right")
					
func _on_textbox_has_finished():
	print("Finished!")
	interaction_mode = false

func _on_raft_has_been_enabled():
	call_deferred("set_collision_mask_value", 6, false)
