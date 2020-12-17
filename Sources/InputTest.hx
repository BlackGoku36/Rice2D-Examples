import rice2d.App;
import kha.Color;
import kha.math.Vector2;
import rice2d.Input;
import kha.Canvas;

using kha.graphics2.GraphicsExtension;

class InputTest {

    var kb = Input.getKeyboard();
    var mouse = Input.getMouse();

    var squarePos = new Vector2();
    var squareSide = 100;

    var circlePos = new Vector2();
    var circleRadius = 100;

    public function new() {
        App.notifyOnUpdate(update);
        App.notifyOnRenderG2(render);
    }
    
    function update() {
        if(kb.down(W)) squarePos.y -= 5;
        else if(kb.down(S)) squarePos.y += 5;
        else if(kb.down(A)) squarePos.x -= 5;
        else if(kb.down(D)) squarePos.x += 5;

        circlePos.x = mouse.x;
        circlePos.y = mouse.y;
    }

    function render(canvas:Canvas) {
        var g = canvas.g2;
        var col = g.color;

        g.color = Color.Blue;
        g.fillCircle(circlePos.x, circlePos.y, circleRadius);
        g.color = Color.Red;
        g.fillRect(squarePos.x, squarePos.y, squareSide, squareSide);

        g.color = col;
    }
}