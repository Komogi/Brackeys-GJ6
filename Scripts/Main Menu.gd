extends VBoxContainer



func _on_Start_pressed() -> void:
	get_tree().change_scene("res://Scenes/GameScene.tscn")

func _on_Settings_pressed() -> void:
	get_tree().change_scene("res://Scenes/Settings.tscn")

func _on_Credits_pressed() -> void:
	get_tree().change_scene("res://Scenes/Credits.tscn")

func _on_Exit_pressed() -> void:
	get_tree().quit()
