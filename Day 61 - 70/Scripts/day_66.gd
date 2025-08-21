extends Node2D

enum Weather { CLEAR, RAIN, SNOW }
var current_weather: Weather = Weather.CLEAR

func _ready():
	$Rain.emitting = false
	$Snow.emitting = false
	$WeatherTimer.start()

func _on_weather_timer_timeout() -> void:
	current_weather = (current_weather + 1) % 3
	_apply_weather()

func _apply_weather():
	$Rain.emitting = (current_weather == Weather.RAIN)
	$Snow.emitting = (current_weather == Weather.SNOW)
