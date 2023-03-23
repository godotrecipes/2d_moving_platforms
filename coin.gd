extends Area2D

var item_textures = {
	"coin": Vector2i(22, 4),
	"gem": Vector2i(23, 4),
	"key_red": Vector2i(18, 23),
	"spike": Vector2i(22, 0)
}

var type = "coin"

func _on_coin_body_entered(body):
	queue_free()
