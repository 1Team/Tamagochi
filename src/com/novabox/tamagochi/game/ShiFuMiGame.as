package com.novabox.tamagochi.game 
{
	import com.novabox.tamagochi.Tamagochi;
	import flash.display.Sprite;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.utils.setInterval;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	/**
	 * ...
	 * @author Alex
	 */
	public class ShiFuMiGame 
	{
		protected static var ROCK:Number = 0;
		protected static var SCISSORS:Number = 1;
		protected static var PAPER:Number = 2;
		
		protected static var TAMAGOCHI:Number = 5;
		protected static var PLAYER:Number = 6;
		protected static var NUL:Number = 7;
		
		protected var sprite:Sprite;
		
		protected var rockBtn:SimpleButton;
		protected var scissorsBtn:SimpleButton;
		protected var paperBtn:SimpleButton;
		
		protected var tamagochi:Tamagochi;
		
		protected var winnerText:TextField;
		
		protected var Img:Loader;
		
		protected var isPlaying:Boolean;
		
		public function ShiFuMiGame(_tamagochi:Tamagochi) 
		{
			tamagochi = _tamagochi;
			sprite = tamagochi.GetGameSprite();
			
			winnerText = new TextField();
			winnerText.mouseEnabled = false;
			winnerText.autoSize = TextFieldAutoSize.CENTER;
			
			sprite.addChild(winnerText);
			winnerText.x = 50;
			winnerText.y = 190;
			
			var rockImg:Loader = new Loader();
			rockImg.load(new URLRequest("./images/rock.png"));
			
			var scissorsImg:Loader = new Loader();
			scissorsImg.load(new URLRequest("./images/scissors.png"));
			
			var paperImg:Loader = new Loader();
			paperImg.load(new URLRequest("./images/paper.png"));
			
			rockBtn = new SimpleButton(rockImg,rockImg,rockImg,rockImg);
			rockBtn.x = 120;
			rockBtn.y = 0;
			rockBtn.addEventListener(MouseEvent.MOUSE_DOWN, rockBtnPressed);
			
			scissorsBtn = new SimpleButton(scissorsImg,scissorsImg,scissorsImg,scissorsImg);
			scissorsBtn.x = 120;
			scissorsBtn.y = 50;
			scissorsBtn.addEventListener(MouseEvent.MOUSE_DOWN, scissorsBtnPressed);
			
			paperBtn = new SimpleButton(paperImg,paperImg,paperImg,paperImg);
			paperBtn.x = 130;
			paperBtn.y = 140;
			paperBtn.addEventListener(MouseEvent.MOUSE_DOWN, paperBtnPressed);
		
			//lanch();
		}
		public function IsPlaying() :Boolean
		{
			return isPlaying;
		}
		
		public function launch() :void
		{
			winnerText.text = "";
			
			sprite.addChild(rockBtn);
			sprite.addChild(scissorsBtn);
			sprite.addChild(paperBtn);
			sprite.addChild(winnerText);
			
			isPlaying = true;
		}
		
		protected function rockBtnPressed(_event:Event) :void
		{
			trace("click rock");
			play(ROCK);
		}
		
		protected function scissorsBtnPressed(_event:Event) :void
		{
			trace("click scissors");
			play(SCISSORS);
		}
		
		protected function paperBtnPressed(_event:Event) :void
		{
			trace("click paper");
			play(PAPER);
		}
		
		protected function play(_value:Number) :void
		{
			var choixTamagochi:Number = Math.round(Math.random() * 2);
			
			var winner:Number;
			
			switch(choixTamagochi)
			{
				case ROCK :
					if (_value == ROCK)
						winner = NUL;
					else if (_value == SCISSORS)
						winner = TAMAGOCHI;
					else if (_value == PAPER)
						winner = PLAYER;
					break;
				case SCISSORS :
					if (_value == ROCK)
						winner = PLAYER;
					else if (_value == SCISSORS)
						winner = NUL;
					else if (_value == PAPER)
						winner = TAMAGOCHI;
					break;
				case PAPER :
					if (_value == ROCK)
						winner = TAMAGOCHI;
					else if (_value == SCISSORS)
						winner = PLAYER;
					else if (_value == PAPER)
						winner = NUL;
					break;
			}
			trace(_value + " " + choixTamagochi);
			trace(winner);
			if (winner != NUL)
			{
				Img = new Loader();
				if (winner == PLAYER)
				{
					winnerText.text = "Tu as gagné";
					Img.load(new URLRequest("./images/Lost.png"));
				}
				else if (winner == TAMAGOCHI)
				{
					winnerText.text = "J'ai gagné";
					Img.load(new URLRequest("./images/Won.png"));
				}
				Img.x = 0;
				Img.y = 0;
				sprite.addChild(Img);
				close();
			}
			else
				winnerText.text = "Match nul";
		}
		
		protected function close() :void
		{
			sprite.removeChild(rockBtn);
			sprite.removeChild(scissorsBtn);
			sprite.removeChild(paperBtn);
			
			var timerSynchro:Timer = new Timer( 1000, 1) ;
            timerSynchro.addEventListener( TimerEvent.TIMER, hideText ) ;
            timerSynchro.start( ) ;
			
			//sprite.removeChild(winnerText);
			while (!tamagochi.IsBoringOK())
			{
				tamagochi.DecreaseFeeling(Tamagochi.FEELING_BORING);
			}
			isPlaying = false;
			
		}
		
		
		protected function hideText (_event:Event) :void
		{
			sprite.removeChild(winnerText);
			sprite.removeChild(Img);
		}
	}

}