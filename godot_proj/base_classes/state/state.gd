class_name State extends Node

var is_active: bool = false

func begin_state():
	if get_parent() is State:
		get_parent().begin_state()
	is_active = true
	_begin_state()

func end_state():
	_end_state()
	is_active = false
	if get_parent() is State:
		get_parent().end_state()

func goto_state() -> String:
	var next := _goto_state()
	if next != "": return next
	if get_parent() is State:
		return get_parent().goto_state()
	return ""

func _begin_state():
	pass

func _end_state():
	pass

func _goto_state() -> String:
	return ""
