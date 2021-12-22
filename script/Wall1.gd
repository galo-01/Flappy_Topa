extends KinematicBody2D

var speed = Global.speed
var velocity = Vector2(-50, 0)


var RNG = RandomNumberGenerator.new()
var minim = 1
var maxim = 5

func _ready():
	RNG.randomize()
	var random = RNG.randi_range(1, maxim)
	print("Wall[",random,"]")
	
	if random == 1:
		position = Vector2(610,240)
	elif random == 2:
		position = Vector2(610,370)
	elif random == 3:
		position = Vector2(610,512)
	elif random == 4:
		position = Vector2(610,661)
	elif random == 5:
		position = Vector2(610,810)
	
	velocity.x = speed


func _process(_delta):
	if Global.dead == false:
		velocity = move_and_slide(velocity, Vector2.UP)
	else:
		velocity = Vector2(0,0)
		$TimerDead.stop()


func _on_TimerDead_timeout():
	queue_free()


func _on_NotDeadly_area_exited(_area):
	Global.score += 1
	print(Global.score)


