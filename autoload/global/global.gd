extends Node

#Booleans for PowerUps
var Raft: bool = false
var Fire: bool = false
var Glove: bool = false

signal enable_raft

# variables and functions for the gifts
var gift_ammount :int = 0
var people_have_been_gifted :int = 0

func reset_gift_ammount():
	gift_ammount = 0
	people_have_been_gifted = 0

# textbox stuff
signal set_textbox( textbox_data:TextboxData )
signal textbox_finished


#func _init():
	#DisplayServer.window_set_size(Vector2i(240 * 4, 160 * 4))
	#DisplayServer.window_set_position()
	
