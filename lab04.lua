#!/user/bin/lua5.3

lgi = require('lgi')
gtk = lgi.require("Gtk", "3.0")
gtk.init()

bld = gtk.Builder()
bld:add_from_file("lab04.glade")

ui = bld.objects

function f()
	ui.Window2:show_all()
	ui.Entry2.text = ui.MyEntry.text
end

function f2()
	ui.Window2:hide()
end

function f3()
	test = gtk.MessageDialog
{
	message_type = gtk.MessageType.INFO,
	buttons = gtk.ButtonsType.OK,
	text = "Hello",
	secondary_text = ui.MyEntry.text
	
}

test:run()
test.on_response = test:hide()
end

ui.Main_Button.on_clicked = f
ui.Button2.on_clicked = f2
ui.Button3.on_clicked = f3
ui.ExitBut.on_clicked = gtk.main_quit
ui.Main_Window.on_destroy = gtk.main_quit
ui.Main_Window:show_all()

gtk.main()
