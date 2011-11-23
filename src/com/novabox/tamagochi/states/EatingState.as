package com.novabox.tamagochi.states 
{
	import com.novabox.tamagochi.Tamagochi;
	import com.novabox.tamagochi.TamagochiState;
	/**
	 * ...
	 * @author Maxime
	 */
	public class EatingState extends TamagochiState
	{
		
		public function EatingState(_tamagochi:Tamagochi) 
		{
			super(_tamagochi, "Eating");
		}
		
		override public function UpdateFeelings() :void{
			GetTamagochi().DecreaseFeeling(Tamagochi.FEELING_HUNGER);
			
			var choixIncrease:Number = Math.round((Math.random())*5 + 1);
			switch (choixIncrease) {
				case 1:
					GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_THIRST);
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
					GetTamagochi().IncreaseFeeling(Tamagochi.FEELING_THIRST);
					break;
			}
		}
	}

}