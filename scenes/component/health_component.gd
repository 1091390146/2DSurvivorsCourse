extends Node

class_name HealthComponent

signal died
signal health_changed
signal health_decreased

@export var max_health: float = 10

var current_health

# Called when the node enters the scene tree for the first time.
func _ready():
	current_health = max_health # Replace with function body.

func get_health_percent():
	if max_health <= 0:
		return 0
	return min(current_health / max_health, 1)

func damage(damage_amount:float):
	current_health = max(current_health - damage_amount, 0)
	health_changed.emit()
	if damage_amount > 0:
		health_decreased.emit()
	Callable(check_death).call_deferred()
	
func check_death():
	if current_health == 0:
		died.emit()
		owner.queue_free()

