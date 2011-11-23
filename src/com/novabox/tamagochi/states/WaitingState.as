package com.novabox.tamagochi.states 
{
	import com.novabox.tamagochi.Tamagochi;
	import com.novabox.tamagochi.TamagochiState;
	/**
	 * ...
	 * @author Ophir
	 */
	public class WaitingState extends TamagochiState
	{
		
		public function WaitingState(_tamagochi:Tamagochi ) 
		{
			super(_tamagochi, "Waiting");
		}
		
		override public function UpdateFeelings() : void
		{
			var choixIncrease:Number = Math.round((Math.random())*6 + 1);
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
				case 5:
					GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_BORING);
					break;
			}
		}
	}

}