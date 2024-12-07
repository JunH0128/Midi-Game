extends Control

# perfect e3d100/f63b00
# great 22eb00/007774
# nice 00dfd6/3c00ac
# ok ffffff/000000
# miss ffffff/000000

func SetTextInfo(text: String):
	$ScoreLevelText.text = "[center]" + text
	
	match text:
		"PERFECT":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("e3d100"))
			$ScoreLevelText.set("theme_override_colors/font_outline_color", Color("f63b00"))
		"GREAT":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("22eb00"))
			$ScoreLevelText.set("theme_override_colors/font_outline_color", Color("007774"))
		"NICE":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("00dfd6"))
			$ScoreLevelText.set("theme_override_colors/font_outline_color", Color("3c00ac"))
		"OK":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("ffffff"))
			$ScoreLevelText.set("theme_override_colors/font_outline_color", Color("000000"))
		"MISS":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("ffffff"))
			$ScoreLevelText.set("theme_override_colors/font_outline_color", Color("000000"))
