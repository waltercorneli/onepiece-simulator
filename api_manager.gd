extends Node

# Se prevedi richieste concorrenti, puoi creare una nuova istanza HTTPRequest per ciascuna chiamata

func get_card_info(card_name: String) -> Dictionary:
	var url = "https://db.ygoprodeck.com/api/v7/cardinfo.php?name=" + card_name
	var http_request = HTTPRequest.new()
	add_child(http_request)
	var err = http_request.request(url)
	if err != OK:
		push_error("Request error: " + str(err))
		http_request.queue_free()
		return {}
	# Attende il completamento della richiesta
	var result = await http_request.request_completed
	var response_code = result[1]
	if response_code != 200:
		push_error("HTTP error: " + str(response_code))
		http_request.queue_free()
		return {}
	var body = result[2]
	var jsonClass = JSON.new()
	var json = jsonClass.parse(body)
	if json.error != OK:
		push_error("JSON parse error: " + json.error_string)
		http_request.queue_free()
		return {}
	http_request.queue_free()
	return json.result  # Restituisce il dizionario con i dati della carta
