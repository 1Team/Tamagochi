﻿package 
{
	/**
	 * Automate Example
	 * Tamagochi
	 * 
	 * @author Ophir / Nova-box
	 * @version 1.0
	 */

	import com.novabox.automate.Automate;
	import com.novabox.automate.AutomateTransition;
	import com.novabox.tools.TimeManager;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Transform;
	import flash.net.URLRequest;
	
	import flash.events.IOErrorEvent;
	
	import com.novabox.tamagochi.*;
	import com.novabox.tamagochi.states.*;

	[SWF(backgroundColor = "#FFFFFF", frameRate = "60", width = "200", height = "190")]

	public class Main extends Sprite 
	{
		public static const BAR_ORIGIN_Y:Number = 110;
		public static const BAR_HEIGHT:Number = 10;
		public static const BAR_WIDTH:Number = 120;
		
		protected var tamagochi:Tamagochi;
		
		protected var hungerBar:Sprite;
		protected var thirstBar:Sprite;
		protected var tirednessBar:Sprite;
		protected var illnessBar:Sprite;
		protected var boringBar:Sprite;
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			
			StartTamagochi();
			InitializeBars();
		}
		
		public function StartTamagochi(): void
		{
			
			tamagochi = new Tamagochi();
			SetupStates()
			
			addChild(tamagochi.GetSprite());
			addChild(tamagochi.GetGameSprite());
			tamagochi.GetSprite().addEventListener(MouseEvent.CLICK, OnClick);
			
			addEventListener(Event.ENTER_FRAME, Update);
			
		}
	
		public function OnClick(_event:Event) : void
		{
			tamagochi.Help();
		}
		
		public function SetupStates() : void
		{
			var waitingState:WaitingState = new WaitingState(tamagochi);
			var hungryState:HungryState = new HungryState(tamagochi);
			var eatingState:EatingState = new EatingState(tamagochi);
			var thirstyState:ThirstyState = new ThirstyState(tamagochi);
			var drinkingState:DrinkingState = new DrinkingState(tamagochi);
			var illState:IllState = new IllState(tamagochi);
			var recoveringState:RecoveringState = new RecoveringState(tamagochi);
			var sleepingState:SleepingState = new SleepingState(tamagochi);
			var tiredState:TiredState = new TiredState(tamagochi);
			var boringState:BoringState = new BoringState(tamagochi);
			var playingState:PlayingState = new PlayingState(tamagochi);
			
			waitingState.AddTransition(new AutomateTransition(hungryState, tamagochi.IsHungry ));
			waitingState.AddTransition(new AutomateTransition(thirstyState, tamagochi.IsThirsty ));
			waitingState.AddTransition(new AutomateTransition(illState, tamagochi.IsIll ));
			waitingState.AddTransition(new AutomateTransition(tiredState, tamagochi.IsTired ));
			waitingState.AddTransition(new AutomateTransition(boringState, tamagochi.IsBoring ));
			
			hungryState.AddTransition(new AutomateTransition(eatingState, tamagochi.IsHelped ));
			
			eatingState.AddTransition(new AutomateTransition(waitingState, tamagochi.IsHungerOk));
			
			thirstyState.AddTransition(new AutomateTransition(drinkingState, tamagochi.IsHelped));
			
			drinkingState.AddTransition(new AutomateTransition(waitingState, tamagochi.IsThirstOK));
		    			
			illState.AddTransition(new AutomateTransition(recoveringState, tamagochi.IsHelped));
			
			recoveringState.AddTransition(new AutomateTransition(waitingState, tamagochi.IsIllnessOK));
			//recoveringState.AddTransition(new AutomateTransition(waitingState, tamagochi.IsHelped));
			
			tiredState.AddTransition(new AutomateTransition(sleepingState, tamagochi.IsHelped));

			sleepingState.AddTransition(new AutomateTransition(waitingState, tamagochi.IsTirednessOK));
			
			boringState.AddTransition(new AutomateTransition(playingState, tamagochi.IsHelped));
			
			playingState.AddTransition(new AutomateTransition(waitingState, tamagochi.IsBoringOK));
			
			tamagochi.SetCurrentState(waitingState);
		}
		
		public function InitializeBars() : void
		{
			hungerBar = new Sprite();
			addChild(hungerBar);
			hungerBar.y = BAR_ORIGIN_Y;
			
			thirstBar = new Sprite();
			addChild(thirstBar);
			thirstBar.y = hungerBar.y + BAR_HEIGHT;
			
			tirednessBar = new Sprite();
			addChild(tirednessBar);
			tirednessBar.y = thirstBar.y + BAR_HEIGHT;
			
			illnessBar= new Sprite();
			addChild(illnessBar);
			illnessBar.y = tirednessBar.y + BAR_HEIGHT;			
			
			boringBar = new Sprite();
			addChild(boringBar);
			boringBar.y = illnessBar.y + BAR_HEIGHT;			
		}
		
		public function UpdateBars() : void
		{
			UpdateBar(hungerBar, tamagochi.GetFeelingValue(Tamagochi.FEELING_HUNGER), 		0xFF9900);
			UpdateBar(thirstBar, tamagochi.GetFeelingValue(Tamagochi.FEELING_THIRST), 		0xAA0000);
			UpdateBar(tirednessBar, tamagochi.GetFeelingValue(Tamagochi.FEELING_TIREDNESS),	0xAAAAAA);
			UpdateBar(illnessBar, tamagochi.GetFeelingValue(Tamagochi.FEELING_ILLNESS),		0x00AA00);
			UpdateBar(boringBar, tamagochi.GetFeelingValue(Tamagochi.FEELING_BORING),		0x0000AA);
		}
		
		public function UpdateBar(_bar:Sprite, _value:Number, _color:Number) : void
		{
			var barWidth:Number = BAR_WIDTH * _value;
			_bar.graphics.clear();
			_bar.graphics.beginFill(_color, 1);
				_bar.graphics.drawRect(0, 0, barWidth, BAR_HEIGHT);
			_bar.graphics.endFill();			
		}
		
		
		public function Update(_event:Event) : void
		{
			TimeManager.timeManager.Update();
			tamagochi.Update();
			UpdateBars();
		}
	}
	
}