class_name TowerDesc extends Resource

enum TowerType { TOWER, UPGRADE }

@export var file: PackedScene
@export var tower_name: String
@export var cost: int
@export var tower_type: TowerType
