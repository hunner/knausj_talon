app: Firefox
app: Firefox Nightly
-
# I use the following custom bindings for vimium:
# # Insert your preferred key mappings here.
# unmapAll
# map <c-,><c-f> LinkHints.activateMode
# map <c-,><c-F> LinkHints.activateModeToOpenInNewForegroundTab
# map <c-.><c-f> LinkHints.activateModeToOpenInNewTab
# map <c-.><c-F> LinkHints.activateModeWithQueue
# map <c-,><c-t> moveTabToNewWindow

follow: key(ctrl-, ctrl-f)
new follow: key(ctrl-, ctrl-F)
back follow: key(ctrl-. ctrl-f)
queue follow: key(ctrl-. ctrl-F)
go back: key(cmd-[)
go forward: key(cmd-])
clear tab: key(cmd-w)
close tab: key(cmd-w)
restore tab: key(cmd-shift-t)
breakout tab: key(ctrl-, ctrl-t)
jump: key(cmd-shift-l)
jump <phrase> [over]:
    key(cmd-shift-l)
    sleep(200ms)
    insert(phrase)
tab search [<phrase>] [over]: 
    key(cmd-shift-l)
    sleep(200ms)
    insert(phrase)
search: key(cmd-f)
down tab: key(cmd-shift-])
up tab: key(cmd-shift-[)
go next tab: key(cmd-shift-])
go last tab: key(cmd-shift-[)
toggle mark: key(cmd-d)
toggle reader: key(cmd-alt-r)
mark pin board: key(alt-p)
copy (URL | location): key(cmd-l cmd-c)
zoom out: key(cmd-=)
zoom in: key(cmd--)
zoom clear: key(cmd-0)
detach tab: key(ctrl-shift-space)
toggle debug: key(cmd-alt-i)
debug network: key(cmd-alt-e)
debug console: key(cmd-alt-k)
