extends StaticBody2D

export var icon_img : Texture

var mission = preload("res://Scenes/Mission.tscn").instance()
var is_task := false

func _process(delta):
	if(!$Timer.is_stopped()):
		print($Timer.time_left)
		
func interaction_can_interact(interactionComponentParent : Node) -> bool:
	return interactionComponentParent is Player

# Not implemented - we'll use the default texture instead
#func interaction_get_texture() -> Texture:
#	pass

func interaction_get_text() -> String:
	return "Press E"

func interaction_get_texture() -> Texture:
	return icon_img
	
func interaction_interact(interactionComponentParent : Node) -> void:
	print("Laptop touched")
	get_parent().add_child(mission)
	task_start()
	# Remove from interaction layer
	# This will cause it to leave the interaction components overlap, which will hide our UI
	# Collision_layer XOR 8 will give all current layers EXCEPT the layer with the bitwsie value 8
	# If you don't know binary, just hover over the layer in the inspector
	# In my case it shows "interactable Bit 3, value 8" <- the value is what we need
	#collision_layer = collision_layer ^ 8

func is_task() -> bool:
	return is_task

func task_start():
	is_task = true
	$Timer.start()

func task_success():
	is_task = false
	print("Laptop task successed")
	
func _on_Timer_timeout():
	print("Laptop task failed")
	is_task = false
	if(get_parent().has_node("Mission")):
		get_parent().get_node("Mission").queue_free()
	#$task_penalty()
	
#Temporary function for time penalty
func task_penalty():
	$GameScreen.Timer -= 5

	
