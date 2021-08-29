extends StaticBody2D

export var icon_img : Texture

signal bin_task_complete

var is_task := false

func interaction_can_interact(interactionComponentParent : Node) -> bool:
	return interactionComponentParent is Player
	

# Not implemented - we'll use the default texture instead
#func interaction_get_texture() -> Texture:
#	pass

func interaction_get_text() -> String:
	return "Press J"
	
func interaction_get_texture() -> Texture:
	return icon_img

func interaction_interact(interactionComponentParent : Node) -> void:
	print("Bin touched")
	task_success()
	# Remove from interaction layer
	# This will cause it to leave the interaction components overlap, which will hide our UI
	# Collision_layer XOR 8 will give all current layers EXCEPT the layer with the bitwsie value 8
	# If you don't know binary, just hover over the layer in the inspector
	# In my case it shows "interactable Bit 3, value 8" <- the value is what we need
	#collision_layer = collision_layer ^ 8

func is_task() -> bool:
	return is_task

func task_start():
	print("Bin task started")
	is_task = true
	$Timer.start()
	
func task_success():
	is_task = false
	print("Bin task successed")
	emit_signal("bin_task_complete")
	
func _on_Timer_timeout():
	print("Bin task failed")
	is_task = false
	#task_penalty()
	
#Temporary function for time penalty
func task_penalty():
	$GameScreen.Timer -= 5


func _on_TaskList_bin_task_start() -> void:
	task_start()
