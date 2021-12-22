extends Node2D

var speed = (Global.speed + 150)

var direction = Vector2(1,0)

onready var parallax = $ParallaxBackground

func _process(delta):
	if Global.dead == false:
		parallax.scroll_offset += direction * speed * delta
