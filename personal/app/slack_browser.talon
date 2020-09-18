title: /Slack/
and tag: browser
-
channel: key(ctrl-k)
jump: key(ctrl-k)
channel <phrase>:
    key(ctrl-k)
    insert(phrase)
jump <phrase>:
    key(ctrl-k)
    insert(phrase)
jump around:
    key(ctrl-k)
    sleep(200ms)
    key(enter)
channel up: key(alt-up)
channel down: key(alt-down)
insert code:
    insert("```")
    key(enter enter)
    insert("```")
    key(up)
