extends Node

var dead = false
var score = 0


# -------------- [ BestScore ] - 

var highscore = 0
const SAVE_FILE_PATH = "user://savedata.save"



func save_score():
	var save_data = File.new()
	save_data.open(SAVE_FILE_PATH,File.WRITE)
	save_data.store_var(highscore)
	save_data.close()

func load_score():
	var save_data = File.new()
	if save_data.file_exists(SAVE_FILE_PATH):
		save_data.open(SAVE_FILE_PATH,File.READ)
		highscore = save_data.get_var()
		save_data.close()


# ------------------------------ 
var speed = -250

func create_node(node):
	add_child(node.instance())
	return node.instance()
