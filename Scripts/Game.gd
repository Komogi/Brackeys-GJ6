extends Node2D

onready var TweenNode = $Tween
onready var MainCamera = $MainCamera
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(MainCamera.position)

func _on_HowToPlay_pressed() -> void:
	TweenNode.interpolate_property(MainCamera, "position", MainCamera.position, 
		$HowToPlayContainer.position, 0.8, Tween.TRANS_CUBIC, Tween.EASE_IN)
	TweenNode.start()

func _on_BackButton_pressed() -> void:
	TweenNode.interpolate_property(MainCamera, "position", MainCamera.position, 
		$TitleScreenContainer.position, 0.8, Tween.TRANS_CUBIC, Tween.EASE_IN)
	TweenNode.start()
