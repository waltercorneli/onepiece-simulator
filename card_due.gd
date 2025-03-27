extends Control

var card_name = "Blue-Eyes White Dragon"  
var card_data = {}  # Qui verrà salvato il dizionario della carta

# Puoi chiamare queste funzioni via pulsante o tramite un ContextMenu
func _on_GetCardInfo_pressed():
	get_card_info()

func get_card_info():
	# Chiama la funzione dell'ApiManager (ricorda di impostarlo come autoload e chiamarlo ad esempio "ApiManager")
	var info = await ApiManager.get_card_info(card_name)
	if info.empty():
		push_error("Carta non trovata!")
		return
	# Supponiamo che info["data"] sia un array; prendiamo il primo elemento
	card_data = info["data"][0]
	print("Dati della carta:", card_data)
	
