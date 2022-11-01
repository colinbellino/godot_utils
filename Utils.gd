tool
extends EditorPlugin

func _enter_tree():
    var editor_settings := get_editor_interface().get_editor_settings()
    var value : bool = editor_settings.get("text_editor/external/use_external_editor")

    if value:
        add_tool_menu_item("Disable external editor", self, "disable_external_editor")
    else:
        add_tool_menu_item("Enable external editor", self, "enable_external_editor")

func _exit_tree():
    remove_tool_menu_item("Enable external editor")
    remove_tool_menu_item("Disable external editor")

func enable_external_editor(ud):
    var editor_settings := get_editor_interface().get_editor_settings()
    editor_settings.set("text_editor/external/use_external_editor", true)

    remove_tool_menu_item("Enable external editor")
    add_tool_menu_item("Disable external editor", self, "disable_external_editor")

func disable_external_editor(ud):
    var editor_settings := get_editor_interface().get_editor_settings()
    editor_settings.set("text_editor/external/use_external_editor", false)

    remove_tool_menu_item("Disable external editor")
    add_tool_menu_item("Enable external editor", self, "enable_external_editor")
