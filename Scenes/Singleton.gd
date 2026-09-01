extends Node
# This is Singleton
var score
var lifes
var sfx
var boss
var powers = {
	"available" = false,
	"type" = 0
}

func _ready():
	boss = false
	sfx = true
	score = 0
<<<<<<< HEAD
	lifes = 5
=======
	lifes = 3
>>>>>>> 64e88e1aba16fde332e7cba75f8e7ec213b85699
	
