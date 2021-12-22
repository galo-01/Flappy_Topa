extends Label


func _ready():
	$Dead.hide()

func _process(_delta):
	set_text (String(Global.score))
	
	$Best.set_text("Best: " + String(Global.highscore))
	
	
	if Global.dead == true:
		$Dead.show()
