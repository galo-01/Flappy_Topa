extends Control




var minim = 1
var maxim = 3

var wall1 = preload("res://script/Wall1.tscn")


# <>

func _ready():
	Global.load_score()
	
	
	Global.dead = false
	Global.score = 0
	Global.speed = -250


func create_node(node):
	add_child(node.instance())
	return node.instance()


# ----------------------------------------------- [ Wall Spawn ] -


func _on_Spawn_timeout():
		create_node(wall1)



# ----------------------------------------------- [ Actions ] -

func _on_Jump_button_down():
	if Global.dead == true:
		
		if Global.score > Global.highscore:
			Global.highscore = Global.score
			Global.save_score()
		
		get_tree().reload_current_scene()


func _on_NextLevel_timeout():
	if Global.speed > -340: 
		Global.speed -= 3
	
	if $Spawn.wait_time > 1.3:
		$Spawn.wait_time -= 0.1
	
	print("[Next level!]",Global.speed)
