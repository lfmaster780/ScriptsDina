extends Node

const PATH = "user://save.dat"

var agreste = {"garanhuns": false,"caruaru":false,"buique":false}
var sertao = {}
var zonaMata = {}
var jogoAtivo = false

var dialogos = []
var personagens = []

var screenSize

func _ready():
	screenSize = OS.get_screen_size()
	TranslationServer.set_locale("pt")
	var file = File.new()
	if file.file_exists(PATH):
		#carregar()
		jogoAtivo = true
	pass
	OS.set_window_maximized(true)

func finalizarGaranhuns():
	agreste["garanhuns"] = true
	
func setDialogo(dialog,person):
	dialogos = dialog
	personagens = person
	
func novoJogo():
	agreste = {"garanhuns": false,"caruaru":false,"buique":false}
	sertao = {}
	zonaMata = {}

func salvar(content):
#    var file = File.new()
#    file.open(PATH, File.WRITE)
#
#    file.close()
	pass

func carregar():
#    var file = File.new()
#    file.open(PATH, File.READ)
#    var content = file.get_as_text()
#    file.close()
	pass
