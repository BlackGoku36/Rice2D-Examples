package;

import g4.G4Test;
import rice2d.App;
import kha.Assets;
import kha.Color;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;

class Main {

	public static function main() {
		App.init("RICE2D", 1280, 810, Color.fromFloats(0.7, 0.7, 0.7), Windowed, ()->{
			// new OverlapTest();
			// new InterpTest();
			// new InputTest();
			// new ShaderTest();
			new G4Test();
		});
	}
}
