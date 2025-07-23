extends Node2D

@onready var label = $Panel/Label
@onready var choice_1 = $Panel/Choice1
@onready var choice_2 = $Panel/Choice2

var choice_result := ""

var dialogues = {
	1: {
		"question": "Do you ever think about where you’ll be five years from now?",
		"choices": ["Yeah, all the time.", "Not really. I just go with the flow."],
		"responses": ["That’s deep. I guess it’s comforting to imagine things working out someday.", "Must be nice… not worrying too much. I envy that sometimes."]
	},
	2: {
		"question": "Sometimes I feel like I don’t matter to anyone. Am I just overthinking?",
		"choices": ["You do matter. A lot.", "Maybe… but we all overthink sometimes."],
		"responses": ["..Thanks. That really means more than you know.", "Yeah... I guess that’s true. Doesn’t make it feel any easier, though."]
	},
	3: {
		"question": "Do you prefer being alone or around people?",
		"choices": ["Alone. I like the quiet.", "Around people. I hate silence."],
		"responses": ["Same. It’s easier to hear your own thoughts that way.", "Yeah, silence can be... loud, sometimes."]
	},
	4: {
		"question": "If you could undo one mistake… would you?",
		"choices": ["Absolutely.", "No. I’ve learned from it."],
		"responses": ["I get that. Some things just stick with you, huh?", "That’s a good mindset. Wish I could see it that way."]
	},
	5: {
		"question": "Rainy days… love ‘em or hate ‘em?",
		"choices": ["Love them. Peaceful and cozy.", "Hate them. Too gloomy."],
		"responses": ["Same here. There’s just something soft about the world when it rains.", "I get that. Everything feels heavier somehow."]
	}
}

func _ready() -> void:
	await show_dialogue(1)
	await show_dialogue(2)
	await show_dialogue(3)
	await show_dialogue(4)
	await show_dialogue(5)

func _on_choice_1_pressed() -> void:
	choice_result = "yes"

func _on_choice_2_pressed() -> void:
	choice_result = "no"

func show_dialogue(topic: int) -> void:
	var data = dialogues[topic]
	label.text = data["question"]
	
	choice_1.text = data["choices"][0]
	choice_2.text = data["choices"][1]
	choice_1.show()
	choice_2.show()

	while choice_result == "":
		await get_tree().process_frame

	choice_1.hide()
	choice_2.hide()

	var index = 0
	if choice_result == "yes":
		index = 0
	else:
		index = 1
	
	label.text = data["responses"][index]

	await get_tree().create_timer(3).timeout
	choice_result = ""
