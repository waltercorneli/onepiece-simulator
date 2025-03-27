extends Control
@onready var http_request = $Button/HTTPRequest

var url = "https://db.ygoprodeck.com/api/v7/cardinfo.php?name="
var cardName = "Dark Magician"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	http_request.request(url + cardName)


func _on_http_request_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	var data = JSON.parse_string(body.get_string_from_utf8())
	print(data.data[0])
