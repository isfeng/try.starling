package
{
	import nape.constraint.Constraint;
	import nape.constraint.PivotJoint;
	import nape.constraint.WeldJoint;
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.shape.Polygon;
	import nape.space.Space;
	import nape.util.BitmapDebug;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author
	 */
	public class WeldTest extends Sprite
	{
		private var debug:BitmapDebug;
		private var space:Space;
		private const size:Number = 22;
		
		public function WeldTest()
		{
			trace("WeldTest");
			addEventListener(Event.ADDED_TO_STAGE, initialize);
		}
		
		protected function initialize():void
		{
			trace("init");
			var gravity:Vec2 = Vec2.weak(0, 600);
			space = new Space(gravity);
			
			debug = new BitmapDebug(stage.stageWidth, stage.stageHeight, stage.color);
			debug.drawConstraints = true;
			Starling.current.nativeOverlay.addChild(debug.display);
			
			var w:int = stage.stageWidth;
			var h:int = stage.stageHeight;
			trace("w " + w);
			trace("h " + h);
			
			var floor:Body = new Body(BodyType.STATIC);
			floor.shapes.add(new Polygon(Polygon.rect(50, (h - 100), (w - 100), 1)));
			floor.shapes.add(new Polygon(Polygon.rect(w / 2, (h - 400), (w - 100), 1)));
			floor.space = space;
			
			// Constraint settings.
			var frequency:Number = 20.0;
			var damping:Number = 1.0;
			
			// Common formatting of constraints.
			var format:Function = function(c:Constraint):void
			{
				c.stiff = false;
				c.frequency = frequency;
				c.damping = damping;
				c.space = space;
			};
			
			var b1:Body = box(1 * w / 3, h / 3, size);
			var b2:Body = box(2 * w / 3, h / 3, size);
			//b2.type = BodyType.STATIC;
			
			var pivotPoint:Vec2 = Vec2.get(w / 2, h / 2);
			//var pivotPoint2:Vec2 = Vec2.get(w / 4, h / 4);
			var phase:Number = b2.rotation - b1.rotation;
			format(new WeldJoint(b1, b2, b1.worldPointToLocal(pivotPoint, true), b2.worldPointToLocal(pivotPoint, true), Math.PI / 4));
			pivotPoint.dispose();
			
			stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		
		private function enterFrameHandler(ev:Event):void
		{
			space.step(1 / 60);
			
			debug.clear();
			debug.draw(space);
			debug.flush();
		}
		
		// Box utility.
		private function box(x:Number, y:Number, radius:Number, pinned:Boolean = false):Body
		{
			var body:Body = new Body();
			body.position.setxy(x, y);
			body.shapes.add(new Polygon(Polygon.box(radius * 2, radius * 2)));
			body.space = space;
			if (pinned)
			{
				var pin:PivotJoint = new PivotJoint(space.world, body, body.position, Vec2.weak(0, 0));
				pin.space = space;
			}
			return body;
		}
	}

}