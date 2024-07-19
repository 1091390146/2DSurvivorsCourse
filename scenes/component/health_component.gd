extends Node

class_name HealthComponent

signal died

@export var max_health: float = 10

var current_health

# Called when the node enters the scene tree for the first time.
func _ready():
	current_health = max_health # Replace with function body.


func damage(damage_amount:float):
	current_health = max(current_health - damage_amount, 0)
	Callable(check_death).call_deferred()
	
func check_death():
	if current_health == 0:
		died.emit()
		owner.queue_free()

