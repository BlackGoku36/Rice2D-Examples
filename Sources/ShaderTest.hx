import kha.Shaders;
import kha.graphics4.ConstantLocation;
import rice2d.Window;
import rice2d.shaders.Shader;
import kha.Canvas;
import rice2d.App;

using kha.graphics2.GraphicsExtension;

class ShaderTest {

    var shader:Shader;
    var time = 0.0;
    var timeCL:ConstantLocation;

    public function new() {

        shader = new Shader({
            fragmentShader: Shaders.test_frag,
            type: Color
        });

        timeCL = shader.getPipeline().getConstantLocation("time");

        App.notifyOnUpdate(update);
        App.notifyOnRenderG2(render);
    }

    function update() {
        time+=0.03;
    }

    function render(canvas:Canvas) {
        var g = canvas.g2;
        var col = g.color;

        var w = Window.getCenter();

        shader.begin(canvas);
        canvas.g4.setFloat(timeCL, time);
        g.fillCircle(w.x, w.y, 150);
        shader.end(canvas);

        g.color = col;
    }
}