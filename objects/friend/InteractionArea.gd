extends Area2D

signal has_gotten_gift


func friend_interact( ):
	
	#if Global.gift_ammount > 0:
		#Global.gift_ammount -= 1
		
	# Basically means has been interacted with, please don't change it for your own sanity. 
	has_gotten_gift.emit()

	
