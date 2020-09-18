from talon import app, Module, Context, actions
if app.platform == "mac":
    from talon.mac import applescript

def run(s):
    return applescript.run(s)

mod = Module('Run applescript scripts')
@mod.action_class
class Actions:
    def run_applescript(s: str) -> str:
        """This runs an applescript script."""
        return run(s)

    def set_output_volume(i: int):
        """Sets the output volume"""
        run("set volume output volume " + str(i))

