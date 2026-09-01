extends Node2D

@export var Enemy:PackedScene
@export var PLAYER:PackedScene
@export var PowerUp:PackedScene
@export var Boss1:PackedScene

var player
var score_file = "user://highscore.txt"
var higscore = 0
var screensize
var Icons = [0,"stair","shield","rocket"]
var shooter_halved = false

func _ready():
	randomize()
	if !Singleton.sfx:
		$Buttons/pause_menu/sfx/sfx.animation = "sfx_off"
	screensize = get_viewport_rect().size
	$Buttons.global_position = Vector2(screensize.x-110,screensize.y-110)
	player = PLAYER.instantiate()
	add_child(player)
	player.position = Vector2(screensize.x/2,900)
	
	$GameOverTimer.wait_time = $GameOverTimer.wait_time / 2.0
	
	if $Powers.has_node("Label"):
		var lbl = $Powers.get_node("Label")
		lbl.text = "Double Tap!"
		lbl.position = Vector2(-20, 50)

func _process(_delta):
	# اصلاح شده از hidden به visible!
	if Singleton.powers.available and !$Powers.visible:
		$Powers/AnimatedSprite.animation = Icons[Singleton.powers.type]
		$Powers.show()
	else:
		$Powers.hide()
	
	if Singleton.score > 2000 and !shooter_halved:
		$ShooterTimer.wait_time = $ShooterTimer.wait_time / 2.0
		shooter_halved = true
	
	if Singleton.lifes == 0 and $GameOverTimer.is_stopped():
		get_tree().paused = true
		check_highscore()
		
		var game_over_sound = AudioStreamPlayer.new()
		game_over_sound.stream = load("res://music/arcade-game-over_C_minor.wav")
		add_child(game_over_sound)
		game_over_sound.play()
		
		var game_over_label = Label.new()
		game_over_label.text = "GAME OVER"
		game_over_label.add_theme_color_override("font_color", Color(1, 0, 0, 1))
		game_over_label.add_theme_font_size_override("font_size", 64)
		game_over_label.set_anchors_preset(Control.PRESET_CENTER)
		game_over_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		game_over_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		game_over_label.global_position = Vector2(screensize.x / 2 - 200, screensize.y / 2 - 50)
		add_child(game_over_label)
		
		$GameOverTimer.start()
		
	if Singleton.score > 1000 and Singleton.boss:
		Singleton.boss = false
	if Singleton.score > 500 and Singleton.score < 600 and !Singleton.boss:
		Singleton.boss = true
		$ShooterTimer.stop()
		$ninjaSpawn.stop()
		var boss1 = Boss1.instantiate()
		add_child(boss1)
		
	if !Singleton.boss and $ninjaSpawn.is_stopped():
		$ninjaSpawn.start()
		
	$Score.text = str(Singleton.score)
	if Singleton.lifes < 5:
		$Lifes/Life5.hide()
		if Singleton.lifes < 4:
			$Lifes/Life4.hide()
			if Singleton.lifes < 3:
				$Lifes/Life3.hide()
				if Singleton.lifes < 2:
					$Lifes/Life2.hide()
					if Singleton.lifes < 1:
						$Lifes/Life1.hide()
	
	if Singleton.lifes >= 4:
		$Lifes.add_theme_color_override("font_color",Color(0,1,0,1))
	elif Singleton.lifes == 3:
		$Lifes.add_theme_color_override("font_color",Color(0.5,1,0,1))
	elif Singleton.lifes == 2:
		$Lifes.add_theme_color_override("font_color",Color("#ffb300"))
	elif Singleton.lifes == 1:
		$Lifes.add_theme_color_override("font_color",Color(1,0,0,1))

	if Singleton.score > 100 and $ShooterTimer.is_stopped() and !Singleton.boss:
		$ShooterTimer.start()

	if Singleton.score > 10 and $PowerUpTimer.is_stopped():
		$PowerUpTimer.start()
	
func _on_EnemySpawn_timeout():
	var e = Enemy.instantiate()
	e.type = 0
	add_child(e)

func _on_GameOverTimer_timeout():
	update_highscore()
	var Main = load("res://Scenes/Main.tscn")
	var main = Main.instantiate()
	get_tree().paused = false
	Singleton.lifes = 5
	Singleton.score = 0
	Singleton.powers.available = 0
	Singleton.boss = false
	get_parent().add_child(main)
	queue_free()

func update_highscore():
	var current_high = 0
	if FileAccess.file_exists(score_file):
		var f = FileAccess.open(score_file, FileAccess.READ)
		if f:
			current_high = int(f.get_as_text())
			f.close()
	
	if Singleton.score > current_high:
		var f = FileAccess.open(score_file, FileAccess.WRITE)
		if f:
			f.store_string(str(Singleton.score))
			f.close()

func check_highscore():
	if FileAccess.file_exists(score_file):
		var f = FileAccess.open(score_file,FileAccess.READ)
		if f:
			var content = f.get_as_text()
			higscore = int(content)
			f.close()

func _on_ShooterTimer_timeout():
	var e = Enemy.instantiate()
	e.type = 1
	add_child(e)

func _on_PowerUpTimer_timeout():
		randomize()
		var power = PowerUp.instantiate()
		var distribution = [1,1,1,1,1,1,2,2,2,3,3,3]
		var rand_position = randi()%12+0
		power.type = distribution[rand_position]
		add_child(power)
		power.position = Vector2(randf_range(150,600),randf_range(400,1120))

func _on_sfx_pressed():
	if Singleton.sfx:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"),true)
		$Buttons/pause_menu/sfx/sfx.animation = "sfx_off"
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"),false)
		$Buttons/pause_menu/sfx/sfx.animation = "sfx_on"
	Singleton.sfx = !Singleton.sfx

func _on_Button_yes_pressed():
	var Main = load("res://Scenes/Main.tscn")
	var main = Main.instantiate()
	get_tree().paused = false
	Singleton.lifes = 5
	Singleton.score = 0
	Singleton.boss = false
	get_parent().add_child(main)
	queue_free()

func _on_Button_no_pressed():
	$Buttons/pause_menu/home/Button_yes.hide()
	$Buttons/pause_menu/home/Button_no.hide()

func _on_pause_menu_pressed():
	if get_tree().paused:
		$Buttons/pause_menu/pauseBtt.animation = "pause"
		get_tree().paused = false
		$Buttons/pause_menu/home.hide()
		$Buttons/pause_menu/sfx.hide()
	else:
		$Buttons/pause_menu/pauseBtt.animation = "play"
		get_tree().paused = true
		$Buttons/pause_menu/home.show()
		$Buttons/pause_menu/sfx.show()

func _on_home_pressed():
	$Buttons/pause_menu/home/Button_no.show()
	$Buttons/pause_menu/home/Button_yes.show()
