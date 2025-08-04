extends Panel

var languageNames = ["English","Arabic"]
var languageCodes = ["en","Ar"]

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func tr_ar():
	TranslationServer.set_locale("Ar")
	updateUI()

func tr_en():
	TranslationServer.set_locale("en")
	updateUI()

func updateUI():
	$Label.text = tr("OPTIONS")
	$CanvasLayer/OptionsPanelElements/MusicLabel.text = tr("MUSIC")
	$CanvasLayer/OptionsPanelElements/SFXLabel.text = tr("SFX")
	$CanvasLayer/OptionsPanelElements/WindowModeLabel.text = tr("WINDOW MODE")
	$CanvasLayer/OptionsPanelElements/ResolutionLabel.text = tr("RESOLUTION ")
	$CanvasLayer/OptionsPanelElements/CheckButton.text = tr("SHOW FPS")
	$CanvasLayer/BackButton.text = tr("BACK")
	$CanvasLayer/MainMenuButton.text = tr("MAIN MENU ")
	$CanvasLayer/OptionsPanelElements/LanguageLabel.text = tr("LANGUAGE")
	$CanvasLayer/OptionsPanelElements/LangOptionButton.set_item_text(1,tr("ARABIC"))
	$CanvasLayer/OptionsPanelElements/LangOptionButton.set_item_text(0,tr("ENGLISH"))

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if GameManager.show_options_panel:
		get_tree().paused = true
		self.visible = true
		$CanvasLayer.visible = true
	else :
		get_tree().paused = false
		self.visible = false
		$CanvasLayer.visible = false
		
	if GameManager.lang == "en":
		tr_en()
	elif GameManager.lang == "Ar":
		tr_ar()


func _on_lang_option_button_item_selected(index: int) -> void:
	match index:
		0:
			GameManager.lang = "en"
		1:
			GameManager.lang = "Ar"
