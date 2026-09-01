extends Area2D
var type = 0

func _ready():
	$Dissapear.start()
	match type:
		0:
			queue_free()
		1:
			$AnimatedSprite.animation = "stair"
		2:
			$AnimatedSprite.animation = "shield"
		3:
			# بزرگ کردن اندازه پاورآپ قلب به دو برابر
			scale = Vector2(2, 2)
			
			var texture = load("res://Art/GUI/playerLife1_blue.png")
			var sprite_frames = $AnimatedSprite.sprite_frames
			if sprite_frames and sprite_frames.has_animation("heart"):
				$AnimatedSprite.animation = "heart"
			else:
				$AnimatedSprite.visible = false
				var spr = Sprite2D.new()
				spr.texture = texture
				add_child(spr)

func _on_PowerUp_area_entered(_area):
	if type == 3:
		# افزایش واقعی جان بازیکن و به‌روزرسانی نودهای گرافیکی جان‌ها
		if Singleton.lifes < 3:
			Singleton.lifes += 1
			# نمایش مجدد جان‌ها بر اساس تعداد جدید
			var main_node = get_node("/root/Game") # یا مسیر والد اصلی
			if has_node("../Lifes"):
				var lifes_node = get_node("../Lifes")
				if Singleton.lifes >= 1: lifes_node.get_node("Life1").show()
				if Singleton.lifes >= 2: lifes_node.get_node("Life2").show()
				if Singleton.lifes >= 3: lifes_node.get_node("Life3").show()
	else:
		Singleton.powers.available = true
		Singleton.powers.type = type
		
	if has_node("CollisionShape2D"):
		$CollisionShape2D.queue_free()
	if has_node("sfx_taken"):
		$sfx_taken.play()
	hide()

func _on_sfx_taken_finished():
	queue_free()

func _on_Dissapear_timeout():
	queue_free()
