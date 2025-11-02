class_name DefaultLoadingState extends State

@export var _first_state: String

func _goto_state() -> String:
	if owner.is_node_ready(): return _first_state
	return ""
