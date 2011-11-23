package com.novabox.tamagochi.game 
{
	import flash.display.Sprite;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.display.Loader;
	/**
	 * ...
	 * @author Alex
	 */
	public class ShiFuMiGame 
	{
		protected var rockBtn:SimpleButton;
		protected var scissorsBtn:SimpleButton;
		protected var paperBtn:SimpleButton;
		
		private var image:Loader;
		
		public function ShiFuMiGame(_currentSprite:Sprite) 
		{
			image = new Loader();
			image.load(new URLRequest("rock.png"));
			
			rockBtn = new SimpleButton(image,image,image,image);
			rockBtn.x = 100;
			rockBtn.y = 20;
			rockBtn.addEventListener(MouseEvent.MOUSE_DOWN, rockBtnPressed);
		
			
			
		}
		
		public function rockBtnPressed()
		{
			trace("click");
		}
	}

}