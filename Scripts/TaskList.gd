extends Control

export var interactables = []
var tasks = ["Bin", "Fax", "Laptop", "Phone", "Water"]
var taskList = []

signal bin_task_start
signal task1_complete

var difficulty = 0.01
var tasks_complete = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_bin_task()
	$Task1Timer.value = 50
	$Task2Timer.value = 75
	$Task3Timer.value = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Task1Timer.value -= 0.05
	$Task2Timer.value -= 0.05
	$Task3Timer.value -= 0.05
	
	if $Task1Timer.value == 0:
		emit_signal("task1_complete", $Task1.text)
		move_tasks_up()
	
	if len(taskList) < 3 and $Task1Timer.value < 90:
		#start_bin_task() # should be randomly generated
		pass

func _on_TaskTimer_timeout() -> void:
	$Task1Timer.value -= (difficulty * tasks_complete)
	$Task2Timer.value -= (difficulty * tasks_complete)
	$Task3Timer.value -= (difficulty * tasks_complete)

func start_bin_task():
	add_to_task_list("Bin Task")
	emit_signal("bin_task_start")
	
func add_to_task_list(task : String):
	if $Task1Timer.value == 0:
		$Task1.set_text(task)
		$Task1Timer.value = 100
	elif $Task2Timer.value == 0:
		$Task2.set_text(task)
		$Task2Timer.value = 100
	elif $Task3Timer.value == 0:
		$Task3.set_text(task)
		$Task3Timer.value = 100

func move_tasks_up():
	$Task1.set_text($Task2.text)
	$Task1Timer.value = $Task2Timer.value
	$Task2.set_text($Task3.text)
	$Task2Timer.value = $Task3Timer.value
	$Task3.set_text("")
	$Task3Timer.value = 0

func _on_Bin_bin_task_complete() -> void:
	if $Task1.text == "Bin Task":
		$Task1Timer.value = 0
	if $Task2.text == "Bin Task":
		$Task2Timer.value = 0
	if $Task3.text == "Bin Task":
		$Task3Timer.value = 0
