extends Node2D

@onready var star_fade_1: Sprite2D = $"Main menu sprites/2nd layer/Star_fade 1"
@onready var star_fade_2: Sprite2D = $"Main menu sprites/2nd layer/Star_fade 2"

@onready var title: Sprite2D = $"Main menu sprites/Front layer/Title"
@onready var buttons: Sprite2D = $"Main menu sprites/Front layer/Buttons"

@onready var station: Sprite2D = $"Main menu sprites/Front layer/Station"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fade_in_and_out(star_fade_1)
	fade_in_and_out(star_fade_2)
	float_ani(station)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	print("play")
	SceneTransition.change_scene_to("uid://cvu4b5kwhjlam")


func _on_settings_pressed() -> void:
	print("setting")


func _on_credits_pressed() -> void:
	print("credits")
	
func fade_in_and_out(sprite: Sprite2D) -> void:
	var tween = create_tween()
	var duration = randf_range(0.5,3)
	tween.tween_property(sprite,"modulate",Color(1.0, 1.0, 1.0, 1.0), duration)
	duration = randf_range(0.5,3)
	tween.chain().tween_property(sprite,"modulate", Color(0,0,0,0), duration)
	
	await tween.finished 
	fade_in_and_out(sprite)
	
func float_ani(sprite: Sprite2D) -> void:
	var tween = create_tween()
	tween.tween_property(sprite, "position", Vector2(randf_range(-15,15),randf_range(35,-35)), 1)
	tween.chain().tween_property(sprite, "position", Vector2(randf_range(15,-15),randf_range(-35,35)), 1.5)
	await tween.finished
	float_ani(sprite)
