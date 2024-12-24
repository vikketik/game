extends Interactable

func _ready() -> void:
	$Label2.text = " "
	
func _on_interacted(body: Variant) -> void:
	if Kanon.kanon_afgevuurd >= 3:
		$Label2.text = "hallo goed gedaan je hebt het overleefd en alle drie de kanonen afgevuurd \n je word gepromoveerd tot Planetenverteidigungskanonenkommandant  \n succes"
		print("talk")
		await get_tree().create_timer(20).timeout
		get_tree().quit()
	else: 
		$Label2.text = "Hey Je moet alle 3 de kanon afvuren komaan snel!!!"
		await get_tree().create_timer(5).timeout
		$Label2.text = " "
