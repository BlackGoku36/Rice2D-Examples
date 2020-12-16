
import kha.Canvas;
import rice2d.Overlap;
import rice2d.Window;
import kha.Color;
import kha.math.Vector2;
import rice2d.App;
import rice2d.Input;
using rice2d.math.MathExtension;
using rice2d.math.Vec2Extension;
using kha.graphics2.GraphicsExtension;

enum CollisionType {
    RectRect;
    CircleCircle;
    CircleRect;
}

class OverlapTest {
    var kb = Input.getKeyboard();
    var mouse = Input.getMouse();

    var rect1Pos:Vector2 = new Vector2();
    var rect1Width = 200;
    var rect1Height = 200;
    var rect2Pos: Vector2 = new Vector2();
    var rect2Width = 200;
    var rect2Height = 200;

    var circle1Pos:Vector2 = new Vector2();
    var circle1Radius = 100;
    var circle2Pos:Vector2;
    var circle2Radius = 100;

    var collide = false;
    var collisionType: CollisionType = RectRect;

    public function new() {

        circle2Pos = Window.getCenter();
        rect2Pos.x = Window.getCenter().x-(rect2Width/2);
        rect2Pos.y = Window.getCenter().y-(rect2Height/2);
        
        App.notifyOnUpdate(update);
        App.notifyOnRender(render);
    }

    public function update() {
         if(kb.started(One)){
            collisionType = RectRect;
        }else if(kb.started(Two)){
            collisionType = CircleCircle;
        }else if(kb.started(Three)){
            collisionType = CircleRect;
        }

        switch (collisionType){
            case RectRect:
                rect1Pos.x = mouse.x;
                rect1Pos.y = mouse.y;
                collide = Overlap.RectvsRect(rect1Pos, rect1Width, rect1Height, rect2Pos, rect2Width, rect2Height);
            case CircleCircle:
                circle1Pos.x = mouse.x;
                circle1Pos.y = mouse.y;
                collide = Overlap.CirclevsCircle(circle1Pos, circle1Radius, circle2Pos, circle2Radius);
            case CircleRect:
                circle1Pos.x = mouse.x;
                circle1Pos.y = mouse.y;
                collide = Overlap.CirclevsRect(circle1Pos, circle1Radius, rect2Pos, rect2Width, rect2Height);
            case _:
        }
    }

    public function render(canvas:Canvas) {
        var g = canvas.g2;
        var col = g.color;
        g.font = App.font;
        g.fontSize = 30;
        var h = g.font.height(g.fontSize);
        g.color = Color.Black;
        g.drawString("Press number key to change", 5, 0);
        g.drawString("1. Rect vs Rect", 5, h);
        g.drawString("2. Circle vs Circle", 5, h*2);
        g.drawString("3. Circle vs Rect", 5, h*3);
        g.color = Color.Blue;
        if(collide) g.color = Color.Red;
        switch (collisionType){
            case RectRect:
                g.fillRect(rect1Pos.x, rect1Pos.y, rect1Width, rect1Height);
                g.fillRect(rect2Pos.x, rect2Pos.y, rect2Width, rect2Height);
            case CircleCircle:
                g.fillCircle(circle1Pos.x, circle1Pos.y, circle1Radius);
                g.fillCircle(circle2Pos.x, circle2Pos.y, circle2Radius);
            case CircleRect:
                g.fillCircle(circle1Pos.x, circle1Pos.y, circle1Radius);
                g.fillRect(rect2Pos.x, rect2Pos.y, rect2Width, rect2Height);
            case _:
        }
        g.color = col;
    }
}
