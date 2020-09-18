from talon import Module, app, actions

mod = Module()


@mod.action_class
class standard_actions:
    def standard_open_clipper(phrase: str):
        """Open clipboard history"""
        if app.platform == "mac":
            actions.key("cmd-ctrl-c")
        else:
            actions.key("super-ctrl-c")
        actions.sleep("100ms")
        actions.insert(phrase)
