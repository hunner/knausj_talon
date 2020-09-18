jump: user.ide_find_everywhere()
jump <phrase> [over]:
  user.idea("action SearchEverywhere")
  sleep(500ms)
  insert(phrase)
tab left: key(cmd-shift-[)
tab right: key(cmd-shift-])
