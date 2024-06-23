extends CanvasLayer

var textbox_reference_data :TextboxData
var input_delay_timer :float = 0.0

func _ready():
	Global.set_textbox.connect(_on_text_box_set)

func _physics_process(delta):
	input_delay_timer -= 1 * delta

func _input(event):
	if Input.is_action_just_pressed("interact") and input_delay_timer < 0:
		if textbox_reference_data and textbox_reference_data.next_set:
			input_delay_timer = 0.2
			Global.set_textbox.emit(textbox_reference_data.next_set)
		else:
			visible = false
			Global.textbox_finished.emit()

func _on_text_box_set( data ):
	if data:
		visible = true
		textbox_reference_data = data
		$Label.text = textbox_reference_data.text
