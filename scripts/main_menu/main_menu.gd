extends Control

var languageNames = ["English","Arabic"]
var languageCodes = ["en","Ar"]

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if GameManager.lang == "en":
		tr_en()
	elif GameManager.lang == "Ar":
		tr_ar()

func tr_ar():
	TranslationServer.set_locale("Ar")
	updateUI()

func tr_en():
	TranslationServer.set_locale("en")
	updateUI()

func updateUI():
	$MainMenuButtons/StartButton.text = tr("START")
	$MainMenuButtons/OptionsButton.text = tr("OPTIONS")
	$MainMenuButtons/ExitButton.text = tr("EXIT")
