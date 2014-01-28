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
	
	[SWF(width="400",height="300",frameRate="60",backgroundColor="#4a4137")]
	public class Startup extends Sprite
	{
		public function Startup()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP_LEFT;
 
            // Create a Starling instance that will run the "Game" class
            _starling = new Starling(Game, stage);
            _starling.start();
			
			addChild(new Stats());

		}
		
		private var _starling:Starling;
		
	}
}