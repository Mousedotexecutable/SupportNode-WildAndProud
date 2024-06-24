extends CanvasLayer


func _input(event):
	if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("ui_accept"):
		get_tree().call_deferred("change_scene_to_file", "res://scenes/loading_screen/loading_screen3.tscn")
