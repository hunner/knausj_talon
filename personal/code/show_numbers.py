from collections import namedtuple
import time

from talon import Module, Context, canvas, ui, actions

label_data = namedtuple('label_data', ('el', 'title', 'rect', 'action'))

mod = Module()
@mod.action_class
class Actions:
    def numbers_pick(n: int):
        """Pick from the displayed numbers"""
        if not interactor.showing:
            raise Exception('Numbers are not visible')
        interactor.pick(n)

    def numbers_cancel():
        """Cancel the number overlay"""
        if not interactor.showing:
            raise Exception('Numbers are not visible')
        interactor.cancel()

    def numbers_show():
        """Show speakable numbers over clickable UI elements"""
        if interactor.showing:
            interactor.cancel()
            # raise Exception('Numbers are already shown')
        interactor.show()

class Interactor:
    def __init__(self):
        self.mapping = {}
        self.labels = []
        self.showing = False
        self.win = None
        self.canvas = None
        ui.register('', self.cancel_if_background)

    def show(self):
        self.showing = True
        win = self.win = ui.active_window()
        wrect = win.rect

        elements = win.children.find(
            {'AXRole': 'AXButton'},
            {'AXRole': 'AXLink'},
            {'AXRole': 'AXRadioButton'},
            {'AXSubrole': 'AXTabButton'},
            {'AXRole': 'AXCheckBox'},
            {'AXRole': 'AXPopUpButton'},
            {'AXRole': 'AXTextField'},
        )
        labels = []
        mapping = {}
        for i, el in enumerate(elements):
            title = el.AXTitle.strip()
            label = el.get('AXDescription', '').strip()
            if el.AXRole == 'AXTextField':
                if el.AXEnabled and not el.AXFocused:
                    pos = el.AXFrame['$rect2d']
                    rect = ui.Rect(pos['x'] - wrect.x, pos['y'] - wrect.y, pos['width'], pos['height'])
                    data = label_data(el, title, rect, lambda el: setattr(el, 'AXFocused', True))
                    mapping[title] = data
                    labels.append(data)
            elif title != 'close tab' and 'AXPress' in el.actions:
                title = title.replace('\n', ' ')
                pos = el.AXFrame['$rect2d']
                rect = ui.Rect(pos['x'] - wrect.x, pos['y'] - wrect.y, pos['width'], pos['height'])
                data = label_data(el, title, rect, lambda el: el.perform('AXPress'))
                mapping[title] = data
                labels.append(data)
        self.labels = labels
        self.mapping = mapping

        self.canvas = canvas.Canvas.from_rect(win.rect, paused=True)
        self.canvas.register('draw', self.draw)
        self.canvas.freeze()

    def cancel_if_background(self, topic, obj):
        active = ui.active_window()
        if self.showing and not active or self.win != active:
            self.cancel()

    def cancel(self):
        if self.canvas:
            self.canvas.close()
        self.canvas = None
        self.win = None
        self.showing = False
        self.labels = []
        self.mapping = {}

    def pick(self, n):
        if n >= 0 and n < len(self.labels):
            label = self.labels[n]
            label.action(label.el)
        self.cancel()

    def draw(self, canvas):
        paint = canvas.paint
        wrect = self.win.rect
        pad = 2
        for i, label in enumerate(self.labels):
            rect = label.rect
            rect = ui.Rect(rect.x + wrect.x, rect.y + wrect.y, rect.width, rect.height)
            _, trect = paint.measure_text(str(i))
            target = ui.Rect(rect.left - trect.width / 2 - pad, rect.top - trect.height / 2 - pad, trect.width + pad * 2, trect.height + pad * 2)
            paint.style = paint.Style.FILL
            paint.color = 'white'
            canvas.draw_rect(target)
            paint.color = 'black'
            paint.stroke_width = 1
            paint.style = paint.Style.STROKE
            canvas.draw_rect(target)
            paint.style = paint.Style.FILL
            canvas.draw_text(str(i), target.x + pad, target.y + trect.height + pad / 2)

interactor = Interactor()
