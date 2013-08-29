package 
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author dengsw
	 */
	public class Main extends Sprite 
	{
		private var s3:Sprite;
		private var s2:Sprite;
		private var s1:Sprite;
		private var s4:Sprite;
		
		private var iSpeed:int = 5;
		
		private var pEnd:Point
		private var count:int;
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			trace("===================>>>>");
			trace("pppp~~~");
			
			s1 = createRect();
			s1.x = 88;
			s1.y = 135;			
			addChild(s1);
			
			s2 = createRect();
			s2.x = 179;
			s2.y = 240;			
			addChild(s2);			
			
			s4 = createRect();
			s4.x = 127;
			s4.y = 327;			
			addChild(s4);
			
			
			s3 = createRect();
			s3.x = 150;
			s3.y = 0;			
			addChild(s3);
			
			this.addEventListener(MouseEvent.CLICK, clickHandler);
		}
		
		private function clickHandler(e:MouseEvent):void 
		{			
			if (count==0)
				pEnd = new Point(s1.x, s1.y);
			else if(count==1)
				pEnd = new Point(s2.x, s2.y);
			else if(count==2)
				pEnd = new Point(s4.x, s4.y);
				
			count += 1;	
			
			if (count > 2)
				count = 0;
			this.addEventListener(Event.ENTER_FRAME, enterHandler);
		}
		
		private function enterHandler(e:Event):void 
		{			
			var dx:Number = pEnd.x - s3.x;
			var dy:Number = pEnd.y - s3.y;
			var dist:Number = Math.sqrt(dx * dx + dy * dy)
			var angle:Number = Math.atan2(dy, dx);
			s3.x += iSpeed * Math.cos(angle);
			s3.y += iSpeed * Math.sin(angle);
			
			if (dist <= iSpeed)
			{
				s3.x = pEnd.x;
				s3.y = pEnd.y;
				this.removeEventListener(Event.ENTER_FRAME, enterHandler);
			}
		}
		
		
		
		private function createRect():Sprite
		{
			var s:Sprite = new Sprite();
			var g:Graphics = s.graphics;
			g.beginFill(0x666666, 1);
			g.drawRect(0, 0, 20, 20);
			g.endFill();
			
			return s;
		}		
	}
	
}