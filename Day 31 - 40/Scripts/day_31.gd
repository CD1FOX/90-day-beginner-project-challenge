extends Control

var inventory: Array[String] = []

@onready var inventory_list: ItemList = $InventoryList

func _on_add_item_button_pressed() -> void:
	var new_item = $TextEdit.text
	
	inventory.append(new_item)
	update_inventory_list()

func update_inventory_list():
	inventory_list.clear()
	
	for item in inventory:
		inventory_list.add_item(item)
