extends Control


# Called when the node enters the scene tree for the first time.
#func _ready():
	#$Button.grab_focus()


# Starts the game
func _on_button_pressed():
	get_tree().call_deferred("change_scene_to_file", "res://scenes/loading_screen/loading_screen.tscn")


func _on_button_2_pressed():
	get_tree().quit(0)
