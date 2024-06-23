extends Area2D

func level_exit_interact():
	Global.set_textbox.emit(load("res://textbox_dialogue/level_exit/level_exit.tres"))
