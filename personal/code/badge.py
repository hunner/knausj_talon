from talon import canvas, ui, registry, imgui, Module, actions
from talon.ui import Rect

# This should use a "frozen canvas" not imgui

badge_color = "555555"

class Box(Rect):
    def draw(self, canvas, color='000000'):
        with canvas.saved():
            paint = canvas.paint
            paint.color = color
            paint.style = paint.Style.FILL
            canvas.draw_rect(self)

def update_badge():
    if actions.speech.enabled():
        badge_color = "00ff00"
    else:
        badge_color = "ff0000"

class config:
    color = '666666'
    canvas = None

class Badge:
    def __init__(self):
        self.screen = ui.screens()[0]

    def start(self):
        config.color = get_state_color()
        config.canvas = canvas.Canvas.from_screen(self.screen)
        config.canvas.register('draw', self.draw)

    def stop(self):
        config.canvas.unregister('draw', self.draw)
        config.canvas.close()
        config.canvas = None

    def draw(self, canvas):
        output = Box((self.screen.width - 14), 10, 4, 4)
        output.draw(canvas, color=config.color)

badge = Badge()

def update_badge(modes):
    if 'sleep' in modes:
        config.color = "ff0000"
    else:
        config.color = "00ff00"

def toggle_badge(state, color):
    config.color = color
    if state:
        badge.start()
        registry._modes.register('mode_change', update_badge)
    else:
        registry._modes.unregister('mode_change', update_badge)
        badge.stop()


def get_state_color():
    if actions.speech.enabled():
        return "00ff00"
    else:
        return "ff0000"

mod = Module()
@mod.action_class
class Actions:
    def badge_hide():
        """Shows the status badge"""
        toggle_badge(False, get_state_color())

    def badge_show():
        """Hides the status badge"""
        toggle_badge(True, get_state_color())

# -- OLD
badge_template = """
<style type="text/css">
body {
    width: 5px;
    height: 5px;
    padding: 0;
    margin: 0;
    background-color: {{ color }};
}
</style>
"""
