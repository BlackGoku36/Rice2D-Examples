package;

import rice2d.App;
import kha.Assets;
import kha.Color;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;

class Main {

	public static function main() {
		App.init("RICE2D", 1280, 810);
		new OverlapTest();
		// new InterpTest();
	}
}
