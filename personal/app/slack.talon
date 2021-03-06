app: Slack
-
# Channel
channel: key(cmd-k)
jump: key(cmd-k)
channel <phrase>:
    key(cmd-k)
    insert(phrase)
jump <phrase>:
    key(cmd-k)
    insert(phrase)
jump around:
    key(cmd-k)
    sleep(200ms)
    key(down)
    sleep(500ms)
    key(enter)
([channel] unread last | gopreev): key(alt-shift-up)
([channel] unread next | goneck): key(alt-shift-down)
(slack | lack) [channel] info: key(cmd-shift-i)
channel up: key(alt-up)
channel down: key(alt-down)

# Navigation
go back: key(cmd-[)
go forward: key(cmd-])
(move | next) focus: key(ctrl-`)
[next] (section | zone): key(f6)
(previous | last) (section | zone): key(shift-f6)
(slack | lack) [direct] messages: key(cmd-shift-k)
(slack | lack) threads: key(cmd-shift-t)
(slack | lack) (history [next] | back | backward): key(cmd-[)
(slack | lack) forward: key(cmd-])
[next] (element | bit): key(tab)
(previous | last) (element | bit): key(shift-tab)
(slack | lack) (my stuff | activity): key(cmd-shift-m)
(slack | lack) directory: key(cmd-shift-e)
(slack | lack) (starred [items] | stars): key(cmd-shift-s)
(slack | lack) unread [messages]: key(cmd-j)
(go | undo | toggle) full: key(ctrl-cmd-f)
(slack | lack) (find | search): key(cmd-f)
toggle sidebar: key(cmd-.)

# Messaging
grab left: key(shift-up)
grab right: key(shift-down)
add line: key(shift-enter)
(slack | lack) (slap | slaw | slapper): key(cmd-right shift-enter)
(slack | lack) (react | reaction): key(cmd-shift-\\)
(insert command | commandify): key(cmd-shift-c)
insert code:
    insert("```")
    key(shift-enter shift-enter)
    insert("```")
    key(up)

(slack | lack) (bull | bullet | bulleted) [list]: key(cmd-shift-8)
(slack | lack) (number | numbered) [list]: key(cmd-shift-7)
(slack | lack) (quotes | quotation): key(cmd-shift->)
bold: key(cmd-b)
(italic | italicize): key(cmd-i)
(strike | strikethrough): key(cmd-shift-x)
mark all read: key(shift-esc)
mark channel read: key(esc)
(clear | scrap | scratch): key(cmd-a backspace)

# Files and Snippets
(slack | lack) upload: key(cmd-u)
(slack | lack) snippet: key(cmd-shift-enter)

# Calls
([toggle] mute | unmute): key(m)
(slack | lack) ([toggle] video): key(v)
(slack | lack) invite: key(a)

# Miscellaneous
(slack | lack) shortcuts: key(cmd-/)
