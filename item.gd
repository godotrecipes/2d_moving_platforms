extends Area2D

var item_textures = {
	"coin": Vector2i(22, 4),
	"gem": Vector2i(23, 4),
	"key_red": Vector2i(18, 23),
	"spike": Vector2i(22, 0)
}

var type = "coin":
	set = set_type

func set_type(value):
	type = value
	$Sprite2d.region_rect = Rect2(item_textures[type] * 17, Vector2(16, 16))

func _on_coin_body_entered(body):
	match type:
		"coin":
			queue_free()
		"gem":
			queue_free()
		"spike":
			body.dead = true
			print("dead")
