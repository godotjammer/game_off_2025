class_name TowerSelect extends VBoxContainer

signal tower_selected(tower: Tower)

func _on_test_pressed() -> void:
	tower_selected.emit(Factory.get_instance().spawn_test_tower())
	queue_free()

func _on_gun_pressed() -> void:
	tower_selected.emit(Factory.get_instance().spawn_gun_tower())
	queue_free()
