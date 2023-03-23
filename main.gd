extends Node2D

var item_textures = {
	Vector2i(22, 4): "coin",
	Vector2i(23, 4): "gem",
	Vector2i(18, 23): "key_red",
	Vector2i(22, 0): "spike"
}

var item_scene = load("res://item.tscn")

@onready var tm = $TileMap

func _ready():
	var item_layer = 0
	for i in tm.get_layers_count():
#		printt(i, tm.get_layer_name(i))
		if tm.get_layer_name(i) == "items":
			item_layer = i
	var item_cells = tm.get_used_cells(item_layer)
	for cell in item_cells:
		var data = tm.get_cell_atlas_coords(item_layer, cell)
		if !data in item_textures:
			continue
#		printt(cell, data)
		var item = item_scene.instantiate()
		add_child(item)
		item.type = item_textures[data]
		item.position = tm.map_to_local(cell)
	tm.remove_layer(item_layer)
