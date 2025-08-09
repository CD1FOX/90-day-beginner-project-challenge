extends Node2D

@onready var coins_label = $CoinsLabel
var coins = 10

func _process(_delta: float) -> void:
	coins_label.text = "Coins: $" + str(coins)

func _on_item_1_pressed() -> void:
	if coins <= 0:
		print("Error")
	else:
		coins -= 1


func _on_item_2_pressed() -> void:
	if coins <= 1:
		print("Error")
	else:
		coins -= 2


func _on_item_3_pressed() -> void:
	if coins <= 2:
		print("Error")
	else:
		coins -= 3


func _on_item_4_pressed() -> void:
	if coins <= 3:
		print("Error")
	else:
		coins -= 4


func _on_item_5_pressed() -> void:
	if coins <= 4:
		print("Error")
	else:
		coins -= 5
