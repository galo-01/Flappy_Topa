extends KinematicBody2D

export var gravity = 900
var jump = -550
var velocity = Vector2(0, 0)


func _ready():
	$s_topa.set_frame(0)


func _process(delta):
	velocity.y += gravity * delta

	velocity = move_and_slide(velocity, Vector2.UP)


func _on_Jump_button_down():
	if Global.dead == false:
		velocity.y = jump
		$jump.play()
		$s_topa/AnimationPlayer.stop()
		$s_topa/AnimationPlayer.play("jump")


func _on_Area2D_area_entered(area):
	if area.is_in_group("wall"):
		Global.dead = true
		gravity = 0
		velocity = Vector2(0,0)
		$s_topa.set_frame(1)
		$Replay.start()



