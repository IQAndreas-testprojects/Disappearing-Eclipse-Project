package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	[SWF(width=640, height=480, backgroundColor=0x000000, frameRate=40)]
	public class DisappearingProject extends Sprite
	{
		
		public function DisappearingProject()
		{
			mouseTrail = new MouseTrail(stage);
			stage.addEventListener(MouseEvent.CLICK, randomize);
		}
		
		private var mouseTrail:MouseTrail;
		
		private function randomize(e:Event):void
		{
			mouseTrail.randomizeLine();
		}
	}
}