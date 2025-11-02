@abstract class_name BehaviorGroup extends Behavior

var _children: Array[Behavior]

func _init(children: Array[Behavior]) -> void:
	_children = children
