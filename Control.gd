extends Node2D

var wall1 = preload("res://script/Wall1.tscn")

# <>

func _on_TimerSpawn_timeout():
	Global.create_node(wall1)



