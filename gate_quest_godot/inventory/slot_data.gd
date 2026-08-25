extends Resource
class_name SlotData

const MAX_ITEM_COUNT: int = 64

@export var item_data: ItemData
@export_range(1, MAX_ITEM_COUNT) var item_count: int = 1
