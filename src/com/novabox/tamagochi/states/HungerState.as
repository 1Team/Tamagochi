package com.novabox.tamagochi.states 
{
	/**
	 * ...
	 * @author Brian Teyssier
	 */
	public class HungerState 
	{
		
		public function HungerState() 
		{
			super(_tamagochi, "Hungry");
		}
		
		override public function UpdateFeelings() : void
		{
			GetTamagochi().DecreaseFeeling(Tamagochi.FEELING_HUNGER);
			
			var choixIncrease:Number = Math.round((Math.random())*5 + 1);
			switch (choixIncrease) {
				case 1: 
					GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_HUNGER);
					break;
				case 2:
					GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_THIRST);
					break;
				case 3:
					GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_TIREDNESS);
					break;
				case 4:
					GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_ILLNESS);
					break;
			}
		}
	}

}