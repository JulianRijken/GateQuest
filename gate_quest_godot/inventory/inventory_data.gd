extends Resource
class_name InventoryData

@export var slots: Array[SlotData]

func add_item(item_to_add: ItemData) -> bool:
	if item_to_add.is_stackable:
		for i in slots.size():
			var slot : SlotData = slots[i]
			if slot != null and slot.item_data == item_to_add and slot.item_count < slot.MAX_ITEM_COUNT:
				slot.item_count += 1
				return true

	for i in slots.size():
		var slot : SlotData = slots[i]
		if slot == null:
			var new_slot: SlotData = SlotData.new()
			new_slot.item_data = item_to_add
			slots[i] = new_slot
			return true

	return false

func try_remove_item(item_to_remove: ItemData) -> bool:
	for i in slots.size():
		var slot : SlotData = slots[i]
		if (slot != null):
			if (slot.item_data == item_to_remove):
				if (slot.item_count > 1):
					slot.item_count -= 1
				else:
					slots[i] = null;
					
				return true

	return false

func has_item(item_to_check: ItemData) -> bool:
	for i in slots.size():
		var slot : SlotData = slots[i]
		if slot != null:
			if slot.item_data == item_to_check:
				return true
	
	return false
	
	
func clear_items():
	slots.clear()
	slots.resize(24)	
