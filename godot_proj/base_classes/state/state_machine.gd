class_name StateMachine extends Node

@export var _default: String
@export var _run_physics: bool

var _current_state: State

func _process(_delta: float) -> void:
	if _run_physics: return
	_run_state()

func _physics_process(_delta: float) -> void:
	if not _run_physics: return
	_run_state()

func _find_state(state: String) -> State:
	return _find_in_state(state, self)

func _find_in_state(state: String, root: Node) -> State:
	for child in root.get_children():
		if child.name == state: return child
		var found := _find_in_state(state, child)
		if found != null: return found
	return null

func _run_state():
	if _current_state != null:
		var next := _current_state.goto_state()
		if next != "":
			_current_state.end_state()
			_current_state = _find_state(next)
			_current_state.begin_state()
	if _current_state == null:
		_current_state = _find_state(_default)
		_current_state.begin_state()
