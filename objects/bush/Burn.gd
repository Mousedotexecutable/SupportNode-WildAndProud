extends StaticBody2D


func Burn():
	#Add animation here if we don't want Bush to just disappear
	
	#Deletes Bush from Tree
	queue_free()
