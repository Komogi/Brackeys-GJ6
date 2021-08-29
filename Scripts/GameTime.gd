extends Control

export var minutes := 2
export var seconds := 0
export var tenthSeconds := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if seconds > 0 and tenthSeconds <= 0:
		seconds -= 1
		tenthSeconds = 9
	elif minutes > 0 and seconds <= 0:
		minutes -= 1
		seconds = 59
		
	$Minutes.set_text(str(minutes) + ":")
	
	if seconds >= 10:
		$Seconds.set_text(str(seconds) + ":")
	else:
		$Seconds.set_text("0" + str(seconds) + ":")
		
	$TenthSeconds.set_text(str(tenthSeconds))

func _on_Timer_timeout() -> void:
	tenthSeconds -= 1
