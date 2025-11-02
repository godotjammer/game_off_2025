@abstract class_name Behavior extends RefCounted

enum Result { FAIL, SUCCEED, RUNNING }

var _context: Dictionary[String, Variant]

@abstract func _tick() -> Result

func build() -> Behavior:
	_propogate_context(_context)
	return self

func tick() -> Result:
	return _tick()

func _propogate_context(parent_context: Dictionary[String, Variant]):
	if parent_context != _context:
		parent_context.merge(_context)
		_context = parent_context
