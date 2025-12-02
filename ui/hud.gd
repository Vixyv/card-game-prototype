extends CanvasLayer

@export var map_name_label: Label
@export var map_time_label: Label
@export var map_best_scores_label: Label
@export var map_detector_count_label: Label
@export var map_travel_distance_label: Label

func _ready() -> void:
	visible = false
	map_best_scores_label.visible = false

func show_map_info(map: GameMap) -> void:
	map_name_label.text = map.map_name
	show_map_time(0.0)
	visible = true
	map_best_scores_label.visible = false

func show_map_time(time: float) -> void:
	map_time_label.text = "%ds" % time

## Show new best scores, supply -1 to indicate no new best score.
func show_map_best_scores(time: int, travel_dist: int) -> void:
	var new_scores: String
		
	# NOTE: I don't like this, but it's what the tutorial went with
	if time >= 0:
		if travel_dist >= 0:
			new_scores = (
					"New best time: %ds\nNew best travel distance: %dpx" %
					[time, travel_dist]
				)
		else:
			new_scores = "New best time: %ds" % time
	elif travel_dist >= 0:
		new_scores = "New best travel distance: %dpx" % travel_dist
	else:
		return
	
	map_best_scores_label.text = new_scores
	map_best_scores_label.visible = true

func show_map_detector_count(valid: int, total: int) -> void:
	map_detector_count_label.text = "%d / %d" % [valid, total]

func show_map_travel_distance(dist: float) -> void:
	map_travel_distance_label.text = "%dpx" % dist
