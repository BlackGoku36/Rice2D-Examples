import kha.Canvas;
import rice2d.Tween;
import kha.Color;
import rice2d.Window;
import kha.math.Vector2;
import rice2d.Input;
import rice2d.App;

using rice2d.math.Vec2Extension;
using kha.graphics2.GraphicsExtension;

class InterpTest {
    var kb = Input.getKeyboard();
    var c1 = new Vector2();
    var c2 = new Vector2();
    var c3 = new Vector2();
    var c4 = new Vector2();
    var c5 = new Vector2();
    var c6 = new Vector2();
    var c7 = new Vector2();
    var r = 50;// radius
    var t = 0.0;
    var d = 5; // duration
    var ww = Window.getWindowSize().width;

    public function new() {
        App.notifyOnUpdate(update);
        App.notifyOnRender(render);
    }

    function update() {
        if(t <= d){
            c1 = Vector2.lerp(new Vector2(0, 60), new Vector2(ww - r, 60), Tween.easeLinear(t/d));
            c2 = Vector2.lerp(new Vector2(0, 160), new Vector2(ww - r, 160), Tween.easeSineIn(t/d));
            c3 = Vector2.lerp(new Vector2(0, 260), new Vector2(ww - r, 260), Tween.easeSineOut(t/d));
            c4 = Vector2.lerp(new Vector2(0, 360), new Vector2(ww - r, 360), Tween.easeSineInOut(t/d));
            c5 = Vector2.lerp(new Vector2(0, 460), new Vector2(ww - r, 460), Tween.easeExpoIn(t/d));
            c6 = Vector2.lerp(new Vector2(0, 560), new Vector2(ww - r, 560), Tween.easeExpoOut(t/d));
            c7 = Vector2.lerp(new Vector2(0, 660), new Vector2(ww - r, 660), Tween.easeExpoInOut(t/d));
        }
        t+=1/60;
    }

    function render(canvas:Canvas) {
        var g = canvas.g2;
        var col = g.color;
        g.font = App.font;
        g.fontSize = 50;
        g.color = Color.Black;
        g.drawString("Linear", 10, 40);
        g.drawString("SineIn", 10, 140);
        g.drawString("SineOut", 10, 240);
        g.drawString("SineInOut", 10, 340);
        g.drawString("ExpoIn", 10, 440);
        g.drawString("ExpoOut", 10, 540);
        g.drawString("ExpoInOut", 10, 640);
        g.drawString("And more..", ww/2-g.font.width(g.fontSize, "And more..")/2, 740);
        g.color = Color.Blue;
        g.fillCircle(c1.x, c1.y, r);
        g.fillCircle(c2.x, c2.y, r);
        g.fillCircle(c3.x, c3.y, r);
        g.fillCircle(c4.x, c4.y, r);
        g.fillCircle(c5.x, c5.y, r);
        g.fillCircle(c6.x, c6.y, r);
        g.fillCircle(c7.x, c7.y, r);

        g.color = col;
    }
}