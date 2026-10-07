extends Control

@onready var ordem: LineEdit = $VBoxContainer/LineEdit
@onready var v_box_container: VBoxContainer = $VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_text()
	
func create_text():
	ordem.placeholder_text = "Insira o total de horas semanais trabalhadas: "
		

func _on_line_edit_text_submitted(new_text: String) -> void:
	if !new_text.is_valid_float():
		print_debug("Cagou regra.")
		return
	calcular_porcentagem(new_text as float)
	
func calcular_porcentagem(inserido: float):
	var retorno = Label.new()
	v_box_container.add_child(retorno)
	
	if inserido < 40:
		retorno.text = "Converse com o funcionario, pois o mesmo nao esta a trabalhar o tempo acordado."
		print_debug("Folgado nao ta trabalhandokkkkkkkk.")
	elif inserido == 40:
		retorno.text = "O funcionario esta a trabalhar o tempo acordado, sem fazer horas extras. 0% a mais."
		print_debug("0 horas extras. Sem trabalhista.")
	
	var porcentagem_acima = (inserido / 40) * 100.0 - 100
	print_debug(porcentagem_acima, "% acima de horas")
	
	if porcentagem_acima < 25:
		retorno.text = "O funcionario esta a trabalhar "+ str(porcentagem_acima) + "% a mais."
		print_debug("Trampando mais, mas menos que 10 horas")
	
	if porcentagem_acima >= 25:
		retorno.text = "O funcionario esta a trabalhar "+ str(porcentagem_acima) + "% a mais."
		print_debug("Trampando mais que 10 horas")
		
	if inserido >= 168:
		retorno.text = "Como, brother?"
	
