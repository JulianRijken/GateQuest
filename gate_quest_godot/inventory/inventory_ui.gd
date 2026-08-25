extends Control
class_name InventoryUI

@onready var grid_container: GridContainer = $MarginContainer/GridContainer
const SLOT_UI = preload("uid://cc0v1ih1lelou")

func update(inventory: InventoryData) -> void:
	for child in grid_container.get_children():
		grid_container.remove_child(child)
		child.queue_free() 
	
	for i in inventory.slots.size():
		var new_slot: SlotUI = SLOT_UI.instantiate()
		grid_container.add_child(new_slot)
		
		var slot_data: SlotData = inventory.slots[i]
		if slot_data != null:
			new_slot.texture_rect.texture = slot_data.item_data.texture
			if slot_data.item_count > 1:
				new_slot.item_count_label.text = str(slot_data.item_count)
			else:
				new_slot.item_count_label.visible = false

		else:
			new_slot.item_count_label.visible = false
