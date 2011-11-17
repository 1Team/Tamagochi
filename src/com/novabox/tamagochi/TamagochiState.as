package com.novabox.tamagochi 
{
	/**
	 * Automate Example
	 * Tamagochi
	 * 
	 * @author Ophir / Nova-box
	 * @version 1.0
	 */

	 import com.novabox.automate.*;
	 import com.novabox.tools.TimeManager;
	 import flash.display.Loader;
	 import flash.events.Event;
	 import flash.net.URLRequest;
	 

	public class TamagochiState extends AutomateState
	{
		public static const STATE_IMAGE_ROOT:String = "./images/";
		public static const STATE_IMAGE_EXT:String = ".png";
		
		private var stateTime:Number
		
		private var image:Loader;
		private var imageLoaded:Boolean;
		
		public function TamagochiState(_tamagochi:Tamagochi, _id: String) 
		{
			super(_tamagochi, _id);
			stateTime = 0;
			
			image = new Loader();
			imageLoaded = false;
			image.contentLoaderInfo.addEventListener(Event.COMPLETE, ImageLoaded);
			trace(STATE_IMAGE_ROOT + _id + STATE_IMAGE_EXT);
			image.load(new URLRequest(STATE_IMAGE_ROOT + _id + STATE_IMAGE_EXT));
			
			
		}
		
		protected function ImageLoaded(_e:Event) : void
		{
			imageLoaded = true;
		}
		
		override public function Update() : void
		{
			if (imageLoaded)
			{
				GetTamagochi().SetFacing(image);
				GetTamagochi().setNameState(id);
			}
			stateTime += TimeManager.timeManager.GetFrameDeltaTime();
			if (GetStateTime() > Tamagochi.FEELING_VARIABLE_UPDATE_DELAY)
			{
				UpdateFeelings();
				ResetStateTime();
			}
		}
		
		public function UpdateFeelings() : void
		{
			
		}
		
		override public function Enter() : void
		{
			ResetStateTime();
			if (imageLoaded)
			{
				
			}
		}
		
		public function GetTamagochi() : Tamagochi
		{
			return (automate as Tamagochi);
		}
		
		public function ResetStateTime() : void
		{
			stateTime = 0;
		}
		
		public function GetStateTime() : Number
		{
			return stateTime;
		}
	}

}