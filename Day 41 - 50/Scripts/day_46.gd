extends Node2D

@onready var mini_viewport := $MiniViewport
@onready var player := $Player
@onready var player_mini := $MiniViewport/MinimapContainer/PlayerMini
@onready var minimap_display := $CanvasLayer/MinimapDisplay

func _ready():
	# Show the viewport texture in the TextureRect
	minimap_display.texture = mini_viewport.get_texture()

func _process(_delta):
	# Keep the minimap's player position synced with main player
	player_mini.global_position = player.global_position / 4.0  # Scale down if needed
