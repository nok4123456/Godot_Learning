extends CharacterBody2D

const MAX_SPEED = 75


# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.area_entered.connect(on_area_enter)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var target_direction = get_direction_to_player()
	velocity = target_direction * MAX_SPEED
	move_and_slide()


func get_direction_to_player() -> Vector2:
	var player_node = get_tree().get_first_node_in_group("player") as Node2D
	var target_direction = Vector2.ZERO
	if player_node != null:
		target_direction = (player_node.global_position - global_position).normalized()
	return target_direction


func on_area_enter(other_area: Area2D):
	queue_free()
