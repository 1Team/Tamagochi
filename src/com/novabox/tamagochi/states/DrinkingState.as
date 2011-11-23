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
			
			var choixIncrease:Number = Math.round((Math.random())*5 + 1);
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
				case 4:
					GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_BORING);
					break;
				default:
					GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_ILLNESS);
			}
		}
	}

}