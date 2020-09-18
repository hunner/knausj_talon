push: key(right)
posh: key(left)
click: mouse_click()
noise(pop): mouse_click()
# need toggle dark and amigo

key(f10): speech.toggle()
dragon phrase: "<phrase>"
tandem mute: key(cmd-shift-m)
emoji picker: key(cmd-ctrl-space)
show bundle: app.notify(app.bundle())
insert bundle: insert(app.bundle())
switch now: key(cmd:down tab)
switch right: key(tab)
switch left: key(shift-tab)
switch ok: key(cmd:up)
show badge: user.badge_show()
hide badge: user.badge_hide()
empty args: "()"
menubar: key("ctrl-f2")
password amigo: insert(user.keychain_find("login", "user"))


shebang bash: "#!/bin/bash -u\n"

clips [<phrase>]:
  key(cmd-ctrl-c)
  sleep(100ms)
  insert(phrase)

new window: key(cmd-n)
next tab: key(ctrl-tab)
new tab: key(cmd-t)
last tab: key(ctrl-shift-tab)
next space: key(cmd-alt-ctrl-right)
last space: key(cmd-alt-ctrl-left)

launch [<phrase>]:
  key(cmd-space)
  sleep(200ms)
  insert(phrase)
(crap | clear | scratch ): key(cmd-backspace)
more bright: key(brightness_up)
less bright: key(brightness_down)
fancy id: "\\\\uuid"

input volume high: user.run_applescript("set volume input volume 70")
input volume low: user.run_applescript("set volume input volume 40")
output volume <number>: user.set_output_volume(number)



jargon cube control: "kubectl"
jargon git: "git"
jargon control: "ctrl"
[inside] (index | array) [of]: 
	insert("[]") 
	key(left)
empty array: "[]"
