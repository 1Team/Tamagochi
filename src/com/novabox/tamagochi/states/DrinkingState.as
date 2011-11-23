package com.novabox.tamagochi.states 
{
	import com.novabox.tamagochi.Tamagochi;
	import com.novabox.tamagochi.TamagochiState;
	
	/**
	 * ...
	 * @author Alex
	 */
	public class DrinkingState extends TamagochiState
	{
		
		public function DrinkingState(_tamagochi:Tamagochi ) 
		{
			super(_tamagochi, "Drinking");
		}
		
		override public function UpdateFeelings() : void
		{
			GetTamagochi().DecreaseFeeling(Tamagochi.FEELING_THIRST);
			GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_ILLNESS);
			
			var choixIncrease:Number = Math.round((Math.random())*4 + 1);
			switch (choixIncrease) {
				case 1: 
					GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_HUNGER);
					break;
				case 2:
					GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_TIREDNESS);
					break;
				case 3:
					GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_ILLNESS);
					break;
			}
		}
	}

}