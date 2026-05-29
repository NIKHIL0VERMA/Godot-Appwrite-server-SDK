@tool
extends EditorPlugin

const AUTOLOAD_NAME : String = "Appwrite"
const AUTOLOAD_PATH : String = "res://addons/appwrite/appwrite.gd"

func _enable_plugin() -> void:
	add_autoload_singleton(AUTOLOAD_NAME, AUTOLOAD_PATH)

func _disable_plugin() -> void:
	remove_autoload_singleton(AUTOLOAD_NAME)
