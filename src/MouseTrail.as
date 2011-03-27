package
{
	import aRenberg.errors.NullParameterError;
	import aRenberg.utils.EnterFramer;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.filters.BitmapFilter;
	import flash.filters.BlurFilter;
	import flash.geom.Point;
	
	
	public class MouseTrail extends Sprite
	{
		public function MouseTrail(stage:Stage)
		{
			stage.addChild(this);
			
			bmd = new BitmapData(stage.stageWidth, stage.stageHeight, true, 0x00000000);
			bmp = new Bitmap(bmd);
			this.addChild(bmp);
			
			this.clearScreen();
			
			sp = new Sprite();
			this.resetFilter();
			//this.addChild(sp);
			
			lastX = stage.mouseX;
			lastY = stage.mouseY;
			
			EnterFramer.listen(onFrame);
		}
		
		private var sp:Sprite;
		
		private var bmp:Bitmap;
		private var bmd:BitmapData;
		
		private var filter:BitmapFilter;
		
		private var lastX:Number;
		private var lastY:Number;
		
		private function onFrame():void
		{
			var g:Graphics = sp.graphics;
			g.clear();
			g.lineStyle(this.lineThickness, this.lineColor);
			g.moveTo(lastX, lastY);
			lastX = stage.mouseX;
			lastY = stage.mouseY;
			g.lineTo(lastX, lastY);
			
			this.redraw();
		}
		
		private function redraw():void
		{
			bmd.applyFilter(bmd, bmd.rect, new Point(), filter);
			bmd.draw(sp);
		}
		
		
		public var lineThickness:Number = 7;
		public var lineColor:uint = 0x000066;
		public var filterBlur:Number = 4;
		
		
		public function clearScreen():void
		{
			bmd.fillRect(bmd.rect, 0x00000000);
		}
		
		public function randomizeLine():void
		{
			lineThickness = Math.random() * 25;
			lineColor = Math.random() * 0xFFFFFF;
			this.clearScreen();
		}
		
		public function resetFilter():void
		{
			filter = new BlurFilter(filterBlur, filterBlur);
		}

		
		
	}
}