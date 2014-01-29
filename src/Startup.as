package
{
	import Game;
	
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageOrientation;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.geom.Rectangle;
	import flash.system.Capabilities;
	import flash.utils.ByteArray;
	
	import starling.core.Starling;
	import net.hires.debug.Stats;
	import starling.events.ResizeEvent;
	
	[SWF(width="400",height="300",frameRate="60",backgroundColor="#4a4137")]
	
	public class Startup extends Sprite
	{
		public function Startup()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.RESIZE, onResize);
		
			Starling.handleLostContext = true;
			// Create a Starling instance that will run the "Game" class
			_starling = new Starling(Game, stage);
			_starling.showStats = true;
			_starling.start();
		
		}
		
		private var _starling:Starling;
		
		/** This event handler is called when the device rotates. */
		private function onResize(event:ResizeEvent):void
		{
			updateDimensions(event.width, event.height);
			updatePositions(event.width, event.height);
		}
		
		/** Updates the size of stage and viewPort depending on the
		 *  current screen size in PIXELS. */
		private function updateDimensions(width:int, height:int):void
		{
			var scale:Number = Starling.current.contentScaleFactor;
			var viewPort:Rectangle = new Rectangle(0, 0, width, height);
			
			Starling.current.viewPort = viewPort;
			stage.stageWidth = viewPort.width / scale;
			stage.stageHeight = viewPort.height / scale;
		}
		
		/** This is the hard part: update your user interface for the new orientation. */
		private function updatePositions(width:int, height:int):void
		{
			// Update the positions of the objects that make up your game.
		}
	}
}