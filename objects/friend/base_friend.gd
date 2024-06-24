extends Node2D

@export_enum("Glove", "Raft", "Fire") var unlock_options :int = 0

@export var reciving_gift_dialouge :TextboxData
@export var default_dialouge :TextboxData
@export var after_reciving_gift_dialouge :TextboxData

var recived_gift :bool = false


func _on_interaction_area_has_gotten_gift():
	
	if recived_gift:
		Global.set_textbox.emit(after_reciving_gift_dialouge)
	elif Global.gift_ammount > 0:
		recived_gift = true
		Global.people_have_been_gifted += 1
		Global.gift_ammount -= 1
		Global.set_textbox.emit(reciving_gift_dialouge)
		
		# 0 is the Glove, 1 is the Raft, and 2 is the Fire ability
		match(unlock_options):
			0:
				Global.Glove = true
			1:
				Global.enable_raft.emit()
				Global.Raft = true
			2:
				Global.Fire = true
	else:
		Global.set_textbox.emit(default_dialouge)
	#print("hi!!!")
	
	
	
