extends Area3D


func _ready() -> void:
	$Label.text = " "


func _on_area_entered(area: Area3D) -> void:
	$Label.text = "goed gedaan we hebben die lelijke engelse alemaal vermoord \n ik zie een toekomst in jou je mag als Planetenverteidigungskanonenkommandant gaan werken veel succes! ga nu snel naar het vliegtuig"
	
	

func _on_area_exited(area: Area3D) -> void:
	$Label.text = " "
