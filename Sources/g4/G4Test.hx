package g4;

import rice2d.tools.Debug;
import rice2d.App;

class G4Test {

    public static var mesh:Mesh;
    
    public function new() {
        Debug.visible = true;

        mesh = new Mesh();
        mesh.load();
        
        App.notifyOnUpdate(()->{
            mesh.update();
        });

        App.notifyOnRenderG4((canvas)->{
            mesh.render(canvas.g4);
        });
    }
}