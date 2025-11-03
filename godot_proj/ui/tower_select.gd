class_name TowerSelect extends VBoxContainer

signal tower_selected(tower: Tower)

var _list: Dictionary[TowerDesc, Button]

func _ready() -> void:
	var list := ResourceLoader.load("res://towers/main_list.tres") as TowerList
	for item in list.towers:
		_create_button(item)
	MoneyTracker.get_instance().coins_changed.connect(_update_buttons)
	var close := Button.new()
	close.text = "Cancel"
	close.pressed.connect(func():
		queue_free()
		)
	add_child(close)

func _create_button(tower: TowerDesc):
	var button := Button.new()
	button.text = "%s - %d coins" % [tower.tower_name, tower.cost]
	button.disabled = MoneyTracker.get_instance().coins < tower.cost
	button.pressed.connect(func():
		_on_button_press(tower)
		)
	add_child(button)
	_list[tower] = button

func _update_buttons(amount: int):
	for tower in _list.keys():
		_list[tower].disabled = amount < tower.cost

func _on_button_press(tower: TowerDesc):
	tower_selected.emit(tower.file.instantiate())
	MoneyTracker.get_instance().coins -= tower.cost
	queue_free()
