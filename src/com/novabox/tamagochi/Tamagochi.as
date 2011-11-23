package com.novabox.tamagochi 
{
	
	/**
	 * Automate Example
	 * Tamagochi
	 * 
	 * @author Ophir / Nova-box
	 * @version 1.0
	 */

	import com.novabox.automate.Automate;
	import com.novabox.automate.AutomateState;
	import com.novabox.automate.AutomateTransition;
	import com.novabox.tamagochi.states.DrinkingState;
	import flash.accessibility.Accessibility;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	 public class Tamagochi extends Automate
	{
		public static var FEELING_VARIABLE_MIN:Number = 0;
		public static var FEELING_VARIABLE_MAX:Number = 1;
		
		public static var FEELING_VARIABLE_UPDATE_VALUE:Number = 0.1;
		public static var FEELING_VARIABLE_ALERT_VALUE:Number = 0.5;
		
		public static var FEELING_VARIABLE_UPDATE_DELAY:Number = 500;
		
		protected var sprite:Sprite;
		protected var gameSprite:Sprite;
		protected var facingId:String;
		
		public static const FEELING_HUNGER:String = "Hunger";  //faim
		public static const FEELING_THIRST:String = "Thirst";	//soif
		public static const FEELING_TIREDNESS:String = "Tiredness";	//fatigué
		public static const FEELING_ILLNESS:String = "Illness";	//malade
		public static const FEELING_BORING:String = "Boring";	
		
		protected var hunger:Number;
		protected var thirst:Number;
		protected var tiredness: Number;
		protected var illness:Number;
		protected var boring:Number;
		
		protected var currentFacing:DisplayObject;
		protected var helped:Boolean;
		
		protected var nameState:TextField;
			
				
		public function Tamagochi() 
		{
			hunger		= FEELING_VARIABLE_MIN;
			thirst		= FEELING_VARIABLE_MIN;
			tiredness	= FEELING_VARIABLE_MIN;
			illness		= FEELING_VARIABLE_MIN;
			boring		= FEELING_VARIABLE_MIN;
			
			helped = false;
			
			sprite = new Sprite();
			gameSprite = new Sprite();
			currentFacing = null;
				
			InitializeFeelings();
			InitializeTextField();
		}
				
		public function InitializeFeelings() : void
		{
			hunger = Math.random() * (FEELING_VARIABLE_MAX - FEELING_VARIABLE_MIN) + FEELING_VARIABLE_MIN;
			thirst = Math.random() * (FEELING_VARIABLE_MAX - FEELING_VARIABLE_MIN) + FEELING_VARIABLE_MIN;
			tiredness = Math.random() * (FEELING_VARIABLE_MAX - FEELING_VARIABLE_MIN) + FEELING_VARIABLE_MIN;
			illness = Math.random() * (FEELING_VARIABLE_MAX - FEELING_VARIABLE_MIN) + FEELING_VARIABLE_MIN;
			boring = Math.random() * (FEELING_VARIABLE_MAX - FEELING_VARIABLE_MIN) + FEELING_VARIABLE_MIN;
		}
		
		public function InitializeTextField() :void
		{
		    nameState = new TextField();
			nameState.mouseEnabled = false;
			nameState.autoSize = TextFieldAutoSize.CENTER;
			
			sprite.addChild(nameState);
			nameState.x = 45;
			nameState.y = 92;
		}
		
		public function setNameState(_name:String) :void
		{
			nameState.text = _name;
		}

		
		public function GetSprite() : Sprite
		{
			return sprite;
		}
		
		public function GetGameSprite() : Sprite
		{
			return gameSprite;
		}
		
		override public function Update() : void
		{
			super.Update();
			helped = false;
		}
		
		public function SetFacing(_image:DisplayObject): void
		{
			if (currentFacing != null)
			{
				sprite.removeChild(currentFacing);
			}
			currentFacing = _image;
			sprite.addChild(currentFacing);
		}
				

		
		public function Help() : void
		{
			helped = true;
			Update();
		}
		
		public function IsHelped() : Boolean
		{
			return helped;
		}
		
		
		public function IsHungry() : Boolean
		{
			return IsFeelingBad(FEELING_HUNGER);
		}
		
		public function IsHungerOk() : Boolean
		{
			return IsFeelingOK(FEELING_HUNGER);
		}
		
		public function IsThirsty() : Boolean
		{
			return IsFeelingBad(FEELING_THIRST);
		}

		public function IsThirstOK() : Boolean
		{
			return IsFeelingOK(FEELING_THIRST);
		}

		public function IsTired() : Boolean
		{
			return IsFeelingBad(FEELING_TIREDNESS);
		}
		
		public function IsTirednessOK() : Boolean
		{
			return IsFeelingOK(FEELING_TIREDNESS);
		}

		public function IsIll() : Boolean
		{
			return IsFeelingBad(FEELING_ILLNESS);			
		}

		public function IsIllnessOK() : Boolean
		{
			return IsFeelingOK(FEELING_ILLNESS);			
		}
		
		public function IsBoring() : Boolean
		{
			return IsFeelingBad(FEELING_BORING);
		}
		
		public function IsBoringOK() : Boolean
		{
			return IsFeelingOK(FEELING_BORING);
		}
	
		public function IsFeelingOK(_feeling:String) : Boolean
		{
			return (GetFeelingValue(_feeling) == FEELING_VARIABLE_MIN);
		}
		
		public function IsFeelingBad(_feeling:String) : Boolean
		{
			return (GetFeelingValue(_feeling) > FEELING_VARIABLE_ALERT_VALUE);
		}

		public function IncreaseFeeling(_feeling:String) : void
		{
			var feelingValue:Number = GetFeelingValue(_feeling);
			//feelingValue += FEELING_VARIABLE_UPDATE_VALUE/2;
			feelingValue += (Math.round( (Math.random())*(10-1) +1  ))/100;
			if (feelingValue > FEELING_VARIABLE_MAX)
			{
				feelingValue = FEELING_VARIABLE_MAX;
			}
			
			SetFeelingValue(_feeling, feelingValue);	
		}
		
		public function DecreaseFeeling(_feeling:String) : void
		{
			var feelingValue:Number = GetFeelingValue(_feeling);
			feelingValue -= FEELING_VARIABLE_UPDATE_VALUE;
			if (feelingValue < FEELING_VARIABLE_MIN)
			{
				feelingValue = FEELING_VARIABLE_MIN;
			}
			
			SetFeelingValue(_feeling, feelingValue);	
		}

		public function GetFeelingValue(_feeling:String) : Number
		{
			switch(_feeling)
			{
				case FEELING_HUNGER:
					return hunger;
				
				case FEELING_ILLNESS:
					return illness;
				
				case FEELING_THIRST:
					return thirst;
				
				case FEELING_TIREDNESS:
					return tiredness;
					
				case FEELING_BORING:
					return boring;
			}
			
			return -1;
		}
	
		public function SetFeelingValue(_feeling:String, _value:Number) : void
		{
			switch(_feeling)
			{
				case FEELING_HUNGER:
					hunger = _value;
					break;
				
				case FEELING_ILLNESS:
					illness = _value;
					break;
					
				case FEELING_THIRST:
					thirst = _value;
					break;
					
				case FEELING_TIREDNESS:
					tiredness = _value;
					break;
					
				case FEELING_BORING:
					boring = _value;
					break;
			}			
		}
	}

}