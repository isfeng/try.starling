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
	import starling.events.ResizeEvent;
	
	[SWF(frameRate="60", backgroundColor="#ffffff")]
	public class Startup extends Sprite
	{
		public function Startup()
		{
				
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			Starling.handleLostContext = true;
			// Create a Starling instance that will run the "Game" class
			_starling = new Starling(WeldTest, stage);
			
			_starling.showStats = true;
			_starling.start();
		
		}
		
		private var _starling:Starling;
	
	}
}