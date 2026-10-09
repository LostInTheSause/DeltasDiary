extends CanvasLayer


@onready var color_rect: ColorRect = $ColorRect

var scene_to_load: String


# Called when the node enters the scene tree for the first time.
func change_scene_to(scene_path: String) -> void:
	
	color_rect.modulate = Color(1.0, 1.0, 1.0, 0.0)
	scene_to_load = scene_path
	var color_rect_tween: Tween
	color_rect_tween = create_tween().set_trans(Tween.TRANS_SINE)
	color_rect_tween.tween_property(color_rect, "modulate", Color(1.0, 1.0, 1.0), 1.8).finished.connect(_load_new_scene)
	
	
	color_rect_tween.chain().tween_property(color_rect, "modulate", Color(1.0, 1.0, 1.0, 0.0), 1.6)
	

func _load_new_scene() -> void:
	get_tree().call_deferred("change_scene_to_file", scene_to_load)
