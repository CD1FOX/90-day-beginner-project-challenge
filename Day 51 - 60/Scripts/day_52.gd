extends Node2D

var coins = 100
@onready var item_1_text = $Items/Item1/TextEdit
@onready var item_2_text = $Items/Item2/TextEdit
@onready var item_3_text = $Items/Item3/TextEdit
@onready var coins_label = $Items/Coins

func _process(_delta: float) -> void:
	coins_label.text = "Coins: $" + str(coins)


func _on_item_1_button_pressed() -> void:
	coins -= (int(item_1_text.text)*1)


func _on_item_2_button_pressed() -> void:
	coins -= (int(item_2_text.text)*5)


func _on_item_3_button_pressed() -> void:
	coins -= (int(item_3_text.text)*10)
