package
{
	import feathers.controls.Screen;
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.shape.Circle;
	import nape.shape.Polygon;
	import nape.space.Space;
	import nape.util.BitmapDebug;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event
	import nape.util.Debug;
	
	/**
	 * ...
	 * @author
	 */
	public class Game extends Sprite
	{
		private var space:Space;
		private var debug:BitmapDebug;
		
		public function Game()   
		{
			trace("Game");
			addEventListener(Event.ADDED_TO_STAGE, initialize);
		}
		
		protected function initialize():void
		{
			trace("init");
			var gravity:Vec2 = Vec2.weak(0, 600);
			space = new Space(gravity);
			
			debug = new BitmapDebug(stage.stageWidth, stage.stageHeight, stage.color);
			Starling.current.nativeOverlay.addChild(debug.display);
			
			var w:int = stage.stageWidth;
			var h:int = stage.stageHeight;
			trace("w " + w);trace("h " + h);
			
			var floor:Body = new Body(BodyType.STATIC);
			floor.shapes.add(new Polygon(Polygon.rect(50, (h - 50), (w - 100), 1)));
			floor.space = space;
			
			for (var i:int = 0; i < 16; i++)
			{
				var box:Body = new Body(BodyType.DYNAMIC);
				box.shapes.add(new Polygon(Polygon.box(16, 32)));
				box.position.setxy((w / 2), ((h - 50) - 32 * (i + 0.5)));
				box.space = space;
			}
			
			var ball:Body = new Body(BodyType.DYNAMIC);
			ball.shapes.add(new Circle(50));
			ball.position.setxy(50, h / 2);
			ball.angularVel = 10;
			ball.space = space;
			
			stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		
		private function enterFrameHandler(ev:Event):void
		{
			Starling.current.showStats = true;
			//trace("enterFrameHandler");
			
			space.step(1 / 60);
			
			debug.clear();
			debug.draw(space);
			debug.flush();
		}
	
	}

}