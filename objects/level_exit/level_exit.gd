extends Area2D

func level_exit_interact():
	
	#get_tree().call_deferred("change_scene_to_file", "res://scenes/loading_screen/loading_screen2.tscn")
	if Global.people_have_been_gifted >= 2:
		get_tree().call_deferred("change_scene_to_file", "res://scenes/loading_screen/loading_screen2.tscn")
	else:
		Global.set_textbox.emit(load("res://textbox_dialogue/level_exit/level_exit.tres"))
