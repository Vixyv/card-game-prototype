extends CanvasLayer

@export var map_name_label: Label
@export var map_time_label: Label
@export var map_best_time_label: Label

func _ready() -> void:
	visible = false
	map_best_time_label.visible = false

func show_map_info(map: GameMap) -> void:
	map_name_label.text = map.map_name
	show_map_time(0.0)
	visible = true
	map_best_time_label.visible = false

func show_map_time(time: float) -> void:
	map_time_label.text = "%ds" % time

func show_map_best_time(best_time: int) -> void:
	map_best_time_label.text = "New best time: %ds" % best_time
	map_best_time_label.visible = true
