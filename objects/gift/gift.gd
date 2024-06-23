extends Area2D

var time :float = 0.0

func _physics_process(delta):
	
	time += 1 * delta
	$Sprite2D.position.y = sin(time * 5)


func pickup_gift() -> void:
	
	Global.gift_ammount += 1
	queue_free()
