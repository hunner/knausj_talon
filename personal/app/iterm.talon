app: com.googlecode.iterm2
-
fuzzy: key(ctrl-t)
jump: key(alt-t)
where am i:
  insert("pwd")
  key(enter)
list:
  insert("ls")
  key(enter)
go parent:
  insert("cd ..")
  key(enter)

dash <word>$:
  insert(" -")
  insert(word)
  insert(" ")

dash dash <phrase> [over]:
  insert(" --")
  insert(user.formatted_text(phrase, "DASH_SEPARATED"))
  insert(" ")
