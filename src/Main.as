package 
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
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.display.GradientType;
	
	import flash.events.IOErrorEvent;
	
	import com.novabox.tamagochi.*;
	import com.novabox.tamagochi.states.*;

	[SWF(backgroundColor = "#FFFFFF", frameRate = "60", width = "300", height = "250")]

	public class Main extends Sprite 
	{
		public static const BAR_ORIGIN_Y:Number = 130;
		public static const BAR_HEIGHT:Number = 12;
		public static const BAR_WIDTH:Number = 120;
		
		public var formatSimple:TextFormat = new TextFormat();
		
		
		protected var tamagochi:Tamagochi;
		
		protected var hungerBar:Sprite;
		protected var thirstBar:Sprite;
		protected var tirednessBar:Sprite;
		protected var illnessBar:Sprite;
		protected var boringBar:Sprite;
		protected var lifeBar:Sprite;
		
		protected var hungerText:TextField;
		protected var thirstText:TextField;
		protected var tirednessText:TextField;
		protected var illnessText:TextField;
		protected var boringText:TextField;
		protected var lifeText:TextField;
		
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
			SetupStates();
			
			formatSimple.font = "Calibri";
			formatSimple.size = 10;
			formatSimple.color = 0x000000;
			
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
			var deadState:DeadState = new DeadState(tamagochi);
			var unamedState:NamingState = new NamingState(tamagochi);
			
			waitingState.AddTransition(new AutomateTransition(unamedState, tamagochi.IsUnNamed));
			waitingState.AddTransition(new AutomateTransition(deadState, tamagochi.IsDead));
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
			illState.AddTransition(new AutomateTransition(deadState, tamagochi.IsDead));
			
			recoveringState.AddTransition(new AutomateTransition(waitingState, tamagochi.IsIllnessOK));
			//recoveringState.AddTransition(new AutomateTransition(waitingState, tamagochi.IsHelped));
			
			tiredState.AddTransition(new AutomateTransition(sleepingState, tamagochi.IsHelped));

			sleepingState.AddTransition(new AutomateTransition(waitingState, tamagochi.IsTirednessOK));
			
			boringState.AddTransition(new AutomateTransition(playingState, tamagochi.IsHelped));
			
			playingState.AddTransition(new AutomateTransition(waitingState, tamagochi.IsBoringOK));
			
			unamedState.AddTransition(new AutomateTransition(waitingState, tamagochi.IsNamed));
			
			tamagochi.SetCurrentState(waitingState);
		}
		
		public function InitializeBars() : void
		{
			hungerBar = new Sprite();
			
			hungerText = new TextField();
			hungerText.defaultTextFormat = formatSimple;
			
			addChild(hungerBar);
			addChild(hungerText);
			
			hungerBar.y = BAR_ORIGIN_Y;
			hungerText.y = BAR_ORIGIN_Y - 2;
			hungerText.text = "faim : ";
			
			
			thirstBar = new Sprite();
			thirstText = new TextField();
			thirstText.defaultTextFormat = formatSimple;
			addChild(thirstBar);
			addChild(thirstText);
			thirstBar.y = hungerBar.y + BAR_HEIGHT;
			thirstText.y = hungerText.y + BAR_HEIGHT;
			thirstText.text = "soif : ";
			
			tirednessBar = new Sprite();
			tirednessText = new TextField();
			tirednessText.defaultTextFormat = formatSimple;
			addChild(tirednessBar);
			addChild(tirednessText);
			tirednessBar.y = thirstBar.y + BAR_HEIGHT;
			tirednessText.y = thirstText.y + BAR_HEIGHT;
			tirednessText.text = "fatigue : ";
			
			illnessBar = new Sprite();
			illnessText = new TextField();
			illnessText.defaultTextFormat = formatSimple;
			addChild(illnessBar);
			addChild(illnessText);
			illnessBar.y = tirednessBar.y + BAR_HEIGHT;		
			illnessText.y = tirednessText.y + BAR_HEIGHT;
			illnessText.text = "Maladie : ";
			
			boringBar = new Sprite();
			boringText = new TextField();
			formatSimple.color = 0x000000;
			boringText.defaultTextFormat = formatSimple;
			addChild(boringBar);
			addChild(boringText);
			boringBar.y = illnessBar.y + BAR_HEIGHT;	
			boringText.y = illnessText.y + BAR_HEIGHT;
			boringText.text = "ennuie : ";
			
			lifeBar = new Sprite ();
			lifeText = new TextField();
			formatSimple.color = 0x000000;
			lifeText.defaultTextFormat = formatSimple;
			addChild(lifeBar);
			addChild(lifeText);
			lifeBar.y = boringBar.y + 3 * BAR_HEIGHT;
			lifeText.y = boringText.y + 3 * BAR_HEIGHT;
			lifeText.text = "vie : ";
		}
		
		public function UpdateBars() : void
		{
			UpdateBar(hungerBar,	tamagochi.GetFeelingValue(Tamagochi.FEELING_HUNGER), 		0xdf63a3a, 0x4e0a0a);
			UpdateBar(thirstBar,	tamagochi.GetFeelingValue(Tamagochi.FEELING_THIRST), 		0x93a3d7, 0x0d0a4e);
			UpdateBar(tirednessBar,	tamagochi.GetFeelingValue(Tamagochi.FEELING_TIREDNESS),		0xAAAAAA, 0x000000);
			UpdateBar(illnessBar,	tamagochi.GetFeelingValue(Tamagochi.FEELING_ILLNESS),		0x7fbf76, 0x132a04);
			UpdateBar(boringBar,	tamagochi.GetFeelingValue(Tamagochi.FEELING_BORING),		0x97e4f4, 0x118ea9);
			UpdateBar(lifeBar,		tamagochi.GetFeelingValue(Tamagochi.LIFE),					0xeaae39, 0xdf5d0e);
		}
		
		public function UpdateBar(_bar:Sprite, _value:Number, _color:Number, _color2:Number) : void
		{
			var barWidth:Number = BAR_WIDTH * _value;
			_bar.graphics.clear();
			//_bar.graphics.beginFill(_color, 1);
			_bar.graphics.beginGradientFill(GradientType.LINEAR, [_color, _color2], [1, 1], [0, 255]);
			_bar.graphics.drawRect(0, 0, barWidth, BAR_HEIGHT);
			_bar.graphics.endFill();			
		}
		
		public function UpdateTexts() :void {
			UpdateText(hungerText,		tamagochi.GetFeelingValue(Tamagochi.FEELING_HUNGER), "faim");
			UpdateText(thirstText,		tamagochi.GetFeelingValue(Tamagochi.FEELING_THIRST), "soif");
			UpdateText(tirednessText,	tamagochi.GetFeelingValue(Tamagochi.FEELING_TIREDNESS), "fatigue");
			UpdateText(illnessText,		tamagochi.GetFeelingValue(Tamagochi.FEELING_ILLNESS), "maladie");
			UpdateText(boringText,		tamagochi.GetFeelingValue(Tamagochi.FEELING_BORING), "ennui");
			UpdateText(lifeText,		tamagochi.GetFeelingValue(Tamagochi.LIFE), "vie");
		}
		
		public function UpdateText(_text:TextField, _value:Number, typevalue:String):void
		{
			_value = Math.round(_value * 100);
			var pourcentageText:String = typevalue + " : " + _value + "%";
			_text.text = pourcentageText;
		}
		
		public function Update(_event:Event) : void
		{
			TimeManager.timeManager.Update();
			tamagochi.Update();
			UpdateBars();
			UpdateTexts();
		}
	}
	
}