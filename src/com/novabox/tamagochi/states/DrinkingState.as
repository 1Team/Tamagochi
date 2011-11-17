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
		}
	}

}