app: Firefox
app: Firefox Nightly
app: firefox
-
# I use the following custom bindings for vimium:
# unmapAll
# map <c-,><c-,> LinkHints.activateMode
# map <c-,><c-.> LinkHints.activateModeToOpenInNewForegroundTab
# map <c-.><c-,> LinkHints.activateModeToOpenInNewTab
# map <c-.><c-.> LinkHints.activateModeWithQueue
# map <c-,><c-b> moveTabToNewWindow
# map <c-.><c-b> Vomnibar.activateTabSelection

#follow: key("ctrl-, ctrl-f")
#follow new: key("ctrl-, ctrl-F")
#follow back[ground]: key("ctrl-. ctrl-f")
#follow queue: key("ctrl-. ctrl-F")
follow: key("ctrl-, ctrl-,")
follow new: key("ctrl-, ctrl-.")
follow back[ground]: key("ctrl-. ctrl-,")
follow queue: key("ctrl-. ctrl-.")
breakout tab: key("ctrl-, ctrl-b")
detach tab: key("ctrl-, ctrl-b")
jump: key("ctrl-. ctrl-b")
jump <phrase> [over]:
    key("ctrl-. ctrl-b")
    sleep(200ms)
    insert(phrase)
tab search [<phrase>] [over]:
    key("ctrl-. ctrl-b")
    sleep(200ms)
    insert(phrase)
