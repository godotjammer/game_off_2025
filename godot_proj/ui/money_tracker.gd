class_name MoneyTracker extends HBoxContainer

signal coins_changed(amount: int)

@export var _quan_label: Label

var coins: int:
	set(val):
		coins = val
		if is_node_ready(): _update_view()
		coins_changed.emit(coins)

func _ready() -> void:
	_instance = self
	coins = 100
	_update_view()

func _update_view():
	_quan_label.text = str(coins)

static var _instance: MoneyTracker

static func get_instance() -> MoneyTracker:
	return _instance
