extends CanvasLayer

func _ready():
	await get_tree().create_timer(2.0).timeout
	get_tree().call_deferred("change_scene_to_file", "res://scenes/menu/main_menu.tscn")
	
