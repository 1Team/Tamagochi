package com.novabox.tamagochi.states 
{
	import com.novabox.tamagochi.TamagochiState;
	import com.novabox.tamagochi.Tamagochi;
	/**
	 * ...
	 * @author Maxime
	 */
	public class TiredState extends TamagochiState
	{
		
		public function TiredState(_tamagochi:Tamagochi) 
		{
			super(_tamagochi, "Tired");
		}
		
		override public function UpdateFeelings() :void {
			
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
				default :
					GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_ILLNESS);
					break;
			}
		}
		
	}

}