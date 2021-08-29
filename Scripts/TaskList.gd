extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Task1Timer.value = 100
	$Task2Timer.value = 75
	$Task3Timer.value = 50
	$Task4Timer.value = 25

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Task1Timer.value -= 0.2
	$Task2Timer.value -= 0.2
	$Task3Timer.value -= 0.2
	$Task4Timer.value -= 0.2
