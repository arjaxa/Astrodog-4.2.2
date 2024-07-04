extends Button




func _on_Button_pressed():
	if %Gameover.visible:
		%Button.visible = true
