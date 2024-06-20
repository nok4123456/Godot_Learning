extends CanvasLayer

@export var arean_time_manager: Node
@onready var label = %Label


func _process(delta):
	if arean_time_manager == null:
		return
	var time_elapsed = arean_time_manager.get_time_elapsed()
	label.text = format_seconds_to_string(time_elapsed)


func pad_zero(number: int, length: int) -> String:
	return str("%0" + str(length) + "d") % number


func format_seconds_to_string(seconds: float):
	var minutes = floor(seconds / 60)
	var remaining_seconds = round(seconds - (minutes * 60))
	return pad_zero(minutes, 2) + ":" + pad_zero(remaining_seconds, 2)
